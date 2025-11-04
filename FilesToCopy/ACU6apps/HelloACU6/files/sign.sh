#!/bin/sh -e
# Copyright 2021 Actia Nordic AB. All rights reserved.

# -e ensures that the script fails if any command fails

IMAGE_BPAK=$1

SDK_TOP=$(dirname $(readlink -f $0))

# Key slot to use in user (your) keystore when verifying user boot and
# root partitions (built by buildroot).
# Set this to match the key you selected as PRIVATE_KEY.
# Valid values: "dev" and "key1". Default value: "dev"
KEY_SLOT=dev

# Simple example: Sign the image using a key file

# Private key file to use
PRIVATE_KEY=$SDK_TOP/*.pem

if [ $(ls $PRIVATE_KEY | wc -l) -ne 1 ]; then
    echo "Error: Signing should be done using exactly one key"
    echo "Found these keys:" $PRIVATE_KEY
    echo "Change the value of PRIVATE_KEY in $(readlink -f $0)"
    exit 1
fi

echo "Setting $IMAGE_BPAK to be verified by key in slot \"$KEY_SLOT\""
bpak set $IMAGE_BPAK --key-id $KEY_SLOT --keystore-id user-keystore

echo "Signing $IMAGE_BPAK using" $(basename $PRIVATE_KEY)
bpak sign $IMAGE_BPAK --key $PRIVATE_KEY


# Advanced example: Extract a hash and sign it externally.
# Then apply the signature to the image.

# echo "Hashing ${IMAGE_BPAK} contents"
# bpak show $IMAGE_BPAK --hash > ${IMAGE_BPAK}.hash

# echo "Signing ${IMAGE_BPAK} hash"
# # This example shows OpenSSL together with a private key file,
# # but it can be replaced by, e.g., a call to an HSM.
# openssl pkeyutl -sign -inkey $PRIVATE_KEY -in ${IMAGE_BPAK}.hash -out ${IMAGE_BPAK}.sig

# echo "Applying signature to ${IMAGE_BPAK}"
# bpak sign $IMAGE_BPAK --signature ${IMAGE_BPAK}.sig

# You can verify the applied signature using bpak verify, together with the public key,
# on the bpak file
