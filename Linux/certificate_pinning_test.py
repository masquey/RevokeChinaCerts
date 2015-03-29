#/usr/bin/env python
import ssl
import M2Crypto
import hashlib
import json
import base64
import socket
from socket import *
from tlslite.api import *

tests = [
    #{
    #'domain':'www.126.com',
    #'pkey':['dc4fa0d8fb3b6aeef24aa4f378b9c1c63fb538e5d21c4473691ec9c1878c632f08b83541415cad27da8bb2c1743939e0277738fd96b8a055e23cd79903986566', 'd7e4ef3f14da0bdc88c7917274961992325c66363b76288159e8a440ef864fcc16558a7481d98240b25c1206310c959a124cebd8c06baf5dfcd79c266f389428']},
    {
    'domain':'www.alipay.com',
    'pkey':['18f1d378969f462c3150a9c66d353e84df8ef00efbbd589fa35fdd04cf3e46425f7b12a205b3d5cb8b2e708ae650d34e2c9c6b4b8c02d950805ddab77c901767']},
]

class SocksCannotConnect(socket.error):
    pass

def get_pins(fname='pins.txt'):
    f = open(fname, 'r')
    pins = f.readlines()
    f.close()
    generated = []
    for pin in pins:
        domain = pin.split('=')[0]
        hashes = pin.strip().rsplit('|')[-1].split(',')
        if '*.' in domain:
            # Try different replace strategy
            generated.append({'domain': domain.replace('*.', '0.'), 'pkey': hashes})
            generated.append({'domain': domain.replace('*.', 'www.'), 'pkey': hashes})
            generated.append({'domain': domain.replace('*.', ''), 'pkey': hashes})
        else:
            generated.append({'domain': domain, 'pkey': hashes})
    return generated

def get_last_issuer_cert_der(conn):
    sock = socket.socket(AF_INET, SOCK_STREAM)
    try:
        sock.connect( conn )
    except:
        raise SocksCannotConnect
    connection = TLSConnection(sock)
    connection.handshakeClientCert()

    x=connection.session.serverCertChain   # X509CertChain
    y=x.x509List[1]
    return y.bytes

def test_site(assertion):
    port = assertion.get('port', 443)
    conn = (assertion['domain'], port)
    try:
        cert = get_last_issuer_cert_der( conn )
    except socket.error:
        # If cannot connect even without TLS, let it go
        print "Error connecting to", conn, "but no certificate errors involved."
        return
    except TLSRemoteAlert as alert:
        if not assertion['pkey']:
            # Expected to get this error
            return
        raise RuntimeError(assertion, None)
    x509 = M2Crypto.X509.load_cert_der_string(cert)
    pubkey = x509.get_pubkey().as_der()
    digest = hashlib.sha512(pubkey).hexdigest()
    if not digest in assertion['pkey']:
        raise RuntimeError(assertion, digest)

def main():
    global tests
    tests += get_pins()
    try:
        for assertion in tests:
            test_site(assertion)
    except RuntimeError as e:
        print "ERROR: Certificate error!"
        recv_cert = e.args[1] or '<- Certificate from invalid issuer ->'
        msg = "Expected public key hash of %s for %s, got %s" % \
            (e.args[0]['pkey'], e.args[0]['domain'], recv_cert)
        print msg
        

if __name__ == "__main__":
    main()
