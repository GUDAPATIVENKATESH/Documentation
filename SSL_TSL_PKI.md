SSL/TLS/PKI
------------
PKI - Public key Infrastructure
SSL - Secure Socjets Layer
TLS - Transport layer Security

* SSL/TLS are security protocols used to secure network communications.

#### Cryptography
* A method of securing data such that it is trusted and viewable only by authorized parties.
* Public key infrastructure is used to store the crytographic keys.

##### Different storage types of Cryptogrphic keys
1. PKI certificate
2. Smart Card/ Common Access Card (CAC)
3. File
4. Trusted Platform Module (TPM)
5. Token Devices

#### Encryption
* Plaintext is fed into encryption algorithm along with the key. Plaintext is origin data.
* The encryption algarithum results in encrypted data(Ciphertext).
* Only those parties with decryption key can decrypt the ciphertext back into it's origin palintext.

Crytography usages:
* Mobile device encryption
* File system encryption
* Network traffic encryption
* File hashing
* Cryptocurrency blockchain transactions

### Symmetric & Asymmetric encryption

Symmetric
* A single key is generated using a secure random number generator algorithm.
* This key used for encryption and decryption of data.
* Anyone with access to it can decrypt the data, so the key need to maintained secure.
* If the key is compromised, all encrypted data is compromised.
* In this method, the problem is distributing the key safely.

Symmetric Encryption Algorithms

| Algorithm | Maximum Key Size (Bits) |
|-----------|-------------------------|
| AES       | 256  |
| RC4       | 2048 |
| 3DES      | 168  |
| Blowfish  | 448  |

Asymmetric

* A pair of keys get generated using a prime number based mathematical algorithm used by PKI.
* The two keys are public key and private key.

Asymmetric Encryption Algorithms

|Algorithm | Maximum Key Size (Bits) |
|----------|-------------------------|
| RSA      | 4096 |
| Diffie-Hellman | Not Applied |
| ElGamal    | 2048  |
| ECC | 256 |

Diifie-Hellman method used for securely exchanging cryptographic keys over a public channel. Unlike other asymmetric algorithms, Diffie-Hellman is specifically designed for key exchange rather than encryption and decryption. It enables two parties to generate a shared secret key, which can then be used for symmetric encryption.



### SSL/TLS Network Security

Consider a scenario where a website user sends a request to a web server. At that time, the client from the user's side will send a list of supported ciphers. The web server will then respond with the cipher that will be used, along with its PKI certificate, which includes the server's public key and the server's hostname.

#### Public Key Infrastructure Hierarchy

* PKI is collection or hierarchy of digital certificates, these certificates always contains  public keys and can contain mathematical related private keys.
* Private keys are also stored in a separate file.

#### PKI Componenets

1. Certificate Authority(CA): Issues, renews, revoke certificates to User or Devices or Applications, Maintains CRL (Certificate Revokation List)
2. Registration Authority(RA): Also called a subordinate CA, It exists underneth the CA in PKI Hierarchy. This also do issues, renews and revokes certificates.
3. Certificate Revokation List (CRL) or Online Certificate Status Protocol (OCSP): Verify certificate validity using a serial number, because revoked certificates can not be partake in secured communications.
4. Certificate Template: blueprint used when issueing certificates and can be customized depending on our needs and how the resulted issued PKI Certificate are to be used.
5. Certificate: Certificate contains 
    * subject name: to which it was issued, which could be various forms, such as DNS name for a website, or a users email address if its been issued to a user.
    * signature of CA: the digital signature of the certificate authrity or the registration authority.
    * expiry information: Certificate has a limited lifetime, expiry information will present here
    * public/private key: 

#### Single Tier and Multi Tier PKI Hierarchy

* Single-tier: CA will issue certificates to User or applications or devices.
* Multi-tier: Under CA, RA will issue certificates, CA can have multiple RAs.
* Can have RAs for multiple Departments, Projects, Child Companies, Geographic Regions.
* This will incerase the chain of trust
