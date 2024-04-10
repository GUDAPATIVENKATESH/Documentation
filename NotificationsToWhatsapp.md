Sending notification to whatsapp from twilio with Python Flask
--------------------------------------------------------------
* Here we are trying to send application notifications in WhatsApp from twilio platform with python flask code.
* We took RHEL 8 machine in AWS with 1vCPU and 1GiB RAM. The machine alreday has `python3` pre installed.
* In the server we needed [Virtual Environment](https://phoenixnap.com/kb/install-flask) for Flask Set Up.
* Create a sample env `python3 -m venv sample_demo`.
* Install twilio `pip install twilio`.
* Add below code in file with .py extension like `app.py` and run `python app.py`.
    ```py
    import os
    import random
    from twilio.rest import Client

    # Twilio credentials
    account_sid = 'Account_sid'
    auth_token = 'Auth_Token'
    twilio_number = 'whatsapp:+14155238886'  # Your Twilio phone number
    client = Client(account_sid, auth_token)

    # Generate 6-digit OTP
    def generate_otp():
        return ''.join(str(random.randint(0, 9)) for _ in range(6))

    # Send OTP message via WhatsApp
    def send_otp():
        otp = generate_otp()
        message_body = f"Your OTP is: {otp}"
        try:
            message = client.messages.create(
                body=message_body,
                from_=twilio_number,
                to='whatsapp:+91MobileNumber'  # Replace with your personal phone number
            )
            print("OTP sent successfully!")
            return otp  # Return the generated OTP for verification
        except Exception as e:
            print(f"Error sending OTP: {str(e)}")

    # Verify OTP
    def verify_otp(entered_otp, generated_otp):
        return entered_otp == generated_otp

    # Send verification result via WhatsApp
    def send_verification_result(result):
        message_body = f"Verification {'successful!' if result else 'failed.'}"
        try:
            message = client.messages.create(
                body=message_body,
                from_=twilio_number,
                to='whatsapp:+91MobileNumber'  # Replace with your personal phone number
            )
            print("Verification result sent successfully!")
        except Exception as e:
            print(f"Error sending verification result: {str(e)}")

    # Example usage
    def main():
        generated_otp = send_otp()
        entered_otp = input("Enter the OTP received via WhatsApp: ")
        if verify_otp(entered_otp, generated_otp):
            send_verification_result(True)  # Send success message
            print("OTP verification successful!")
        else:
            send_verification_result(False)  # Send failure message
            print("OTP verification failed!")

    if __name__ == "__main__":
        main()
    ```
