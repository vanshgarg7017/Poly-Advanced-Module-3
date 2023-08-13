# POLY_PROOF_MODULE_3_FINAL PROJECT - ZK SNARK Designer
In this project, I will create a circuit using the circom programming language that implements the logical operations.You need to implement the circuit and deploy a verifier on-chain to verify proofs generated from this circuit.

## Quick Start

## zardkat 

A [hardhat-circom](https://github.com/projectsophon/hardhat-circom) template to generate zero-knowledge circuits, proofs, and solidity verifiers

Compile the Multiplier2() circuit and verify it against a smart contract verifier

```
pragma circom 2.0.0;

template Multiplier2 () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;
   signal x;
   signal y;
   signal output q;
   component myAndg = AND();
   component myOrg = OR();
   component myNotg = NOT();
   myAndg.a <== a;
   myAndg.b <== b;
   x <== myAndg.out;
   myNotg.in <== b;
   y <== myNotg.out;
   myOrg.a <== x;
   myOrg.b <== y;
   q <== myOrg.out;
}
template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();
```
# Steps :
1. First, In the terminal type: npm hardhat install
2. After that set PRIVATE_KEY of Metamask in the hardhat.config.ts
3. In the terminal type: npx hardhat circom This will generate the out file with circuit intermediaries and geneate the MultiplierVerifier.sol contract
4. And Last Type: npx hardhat run scripts/deploy.ts --network mumbai

### Prove and Deploy
`npx hardhat run scripts/deploy.ts --network <network_name>`
This script does 4 things  
1. Deploys the MultiplierVerifier.sol contract
2. Generates a proof from circuit intermediaries with `generateProof()`
3. Generates calldata with `generateCallData()`
4. Calls `verifyProof()` on the verifier contract with calldata
