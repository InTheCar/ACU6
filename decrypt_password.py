import argparse
import base64
import python_ecies
import python_ecies.factory
from cryptography.hazmat.primitives import serialization
from cryptography.exceptions import InvalidKey


def decrypt_password(password_b64, private_key):
    """
    Decrypt a Base64-encoded password using an EC private key.
    Raises ValueError if decryption fails.
    """
    decryptor = python_ecies.factory.get_default_hkdf_aesgcm_binary()
    try:
        decoded = base64.standard_b64decode(password_b64)
    except base64.binascii.Error:
        raise ValueError("Invalid Base64 string.")

    try:
        plaintext_bytes = decryptor.decrypt(decoded, private_key)
    except Exception as e:
        raise ValueError(f"Decryption failed: {e}")

    return plaintext_bytes.decode("utf-8")


def load_private_key(pem_path):
    """
    Load an EC private key from a PEM file.
    """
    try:
        with open(pem_path, "rb") as f:
            return serialization.load_pem_private_key(f.read(), password=None)
    except FileNotFoundError:
        raise FileNotFoundError(f"PEM file not found: {pem_path}")
    except ValueError:
        raise ValueError("Failed to load private key. Make sure it's a valid EC private key.")


def main():
    parser = argparse.ArgumentParser(
        description="Decrypt a Base64-encoded password using an EC private key (ECIES)."
    )
    parser.add_argument("pem_file", help="Path to the EC private key in PEM format")
    parser.add_argument("password_b64", help="Encrypted password, Base64-encoded")
    args = parser.parse_args()

    try:
        private_key = load_private_key(args.pem_file)
        decrypted = decrypt_password(args.password_b64, private_key)
        print("🔓 Decrypted password:", decrypted)
    except Exception as e:
        print("⚠ Error:", e)


if __name__ == "__main__":
    main()
