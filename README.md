## wg-encrypt

Batch files to recursively gpg encrypt/decrypt files.

NO WARRANTY.  NO LIABILITY.  SEE LICENSE.

## summary
It is much easier to encrypt a file tree using \*nix than windows.  These batch files make it a little easier.

## usage
- ```install gpg```
- ```wg-encrypt some-directory``` Takes an input directory parameter.  Recurses down the tree and encrypts all files into a new directory called wg-encrypted.
- ```wg-decrypt some-directory``` Takes an input directory parameter.  Recurses down the tree and decrypts all files into a new directory called wg-decrypted.

## improvements
- password should not use ```Passphrase:``` it is not command line history secure.
- encrypt and decrypt output directories should be command line options.
