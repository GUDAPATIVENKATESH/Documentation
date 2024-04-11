Sending notification to whatsapp from twilio with Python Flask
--------------------------------------------------------------
* Here we are trying to send application notifications in WhatsApp from twilio platform with python flask code.
* We took RHEL 8 machine in AWS with 1vCPU and 1GiB RAM. The machine alreday has `python3` pre installed.
* In the server we needed [Virtual Environment](https://phoenixnap.com/kb/install-flask) for Flask Set Up.
* Create a sample env `python3 -m venv sample_demo`.
* Install twilio `pip install twilio`.
* Below code will generate the OTP with expiry time 300 seconds
    ```py
    from flask import Flask, request, jsonify
    import os
    import random
    import time
    from twilio.rest import Client

    app = Flask(__name__)

    # Twilio credentials
    account_sid = 'account_sid'
    auth_token = 'auth_tocken'
    twilio_number = 'whatsapp:+14155238886'  # Your Twilio phone number
    client = Client(account_sid, auth_token)

    # Dictionary to store generated OTPs and their creation time
    otp_store = {}

    # Generate 6-digit OTP
    def generate_otp():
        return ''.join(str(random.randint(0, 9)) for _ in range(6))

    # Send OTP message via WhatsApp
    def send_otp(phone_number):
        otp = generate_otp()
        message_body = f"Your OTP is: {otp}"
        try:
            message = client.messages.create(
                body=message_body,
                from_=twilio_number,
                to=f'whatsapp:{phone_number}'
            )
            otp_store[phone_number] = {'otp': otp, 'timestamp': time.time()}  # Store OTP and its creation time
            return jsonify({'success': True, 'message': 'OTP sent successfully!'}), 200
        except Exception as e:
            return jsonify({'error': str(e)}), 500

    # Verify OTP
    def verify_otp(entered_otp, generated_otp, phone_number):
        if phone_number not in otp_store:
            return False
        stored_otp = otp_store[phone_number]['otp']
        timestamp = otp_store[phone_number]['timestamp']
        # Check if OTP is expired (valid for 5 minutes)
        if time.time() - timestamp > 300:
            return False
        return entered_otp == stored_otp

    # Resend OTP
    @app.route('/resend-otp', methods=['POST'])
    def resend_otp():
        phone_number = request.json.get('phone_number')
        if not phone_number:
            return jsonify({'error': 'Phone number is required'}), 400
        return send_otp(phone_number)

    # Send OTP
    @app.route('/send-otp', methods=['POST'])
    def send_otp_initial():
        phone_number = request.json.get('phone_number')
        if not phone_number:
            return jsonify({'error': 'Phone number is required'}), 400
        return send_otp(phone_number)

    # Verify OTP
    @app.route('/verify-otp', methods=['POST'])
    def verify_otp_route():
        entered_otp = request.json.get('otp')
        phone_number = request.json.get('phone_number')
        if not entered_otp or not phone_number:
            return jsonify({'error': 'Both OTP and phone number are required'}), 400

        if verify_otp(entered_otp, otp_store.get(phone_number, {}).get('otp'), phone_number):
            return jsonify({'success': True, 'message': 'OTP verification successful!'}), 200
        else:
            return jsonify({'success': False, 'message': 'OTP verification failed!'}), 400

    if __name__ == "__main__":
    app.run(debug=True)
    ```


* API for sending OTP
    ```
    curl -X POST -H "Content-Type: application/json" -d '{"phone_number": "+91PhoneNumber"}' http://127.0.0.1:5000/send-otp
    ```

* API for Verifying OTP
    ```
    curl -X POST -H "Content-Type: application/json" -d '{"phone_number": "+91PhoneNumber", "otp": "OTP", "generated_otp": "OTP"}' http://127.0.0.1:5000/verify-otp
    ```

* API for Resending OTP
    ```
    curl -X POST -H "Content-Type: application/json" -d '{"phone_number": "+918169986162"}' http://127.0.0.1:5000/resend-otp
    ```
