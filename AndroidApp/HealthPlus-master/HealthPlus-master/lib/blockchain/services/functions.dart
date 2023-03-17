// import 'dart:html';
//NITIN SURE, MORE SIR ELECTRICAL
import 'dart:convert';
import 'dart:developer';
// import 'dart:html';

import 'package:flutter/services.dart';
// import 'package:javascript/javascript.dart';
// import 'package:healthplus/blockchain/constants.dart';
import 'package:web3dart/web3dart.dart';

import '../constants.dart';

Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString("assets/abi.json");
  //print(abi);
  // print(jsonDecode(abi)["abi"]);
  String contractAddress = contractAddressDep;
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'medicPlus'),
      EthereumAddress.fromHex(contractAddress));
  return contract;
}

Future<List> callFunction(
    String functionName, List<dynamic> args, Web3Client ethClient) async {
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(functionName);
  final result =
      ethClient.call(contract: contract, function: ethFunction, params: args);

  return result;
}

Future<String> transactFunction(String functionName, List<dynamic> args,
    Web3Client ethClient, String sender) async {
  EthPrivateKey credential = EthPrivateKey.fromHex(sender);
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(functionName);

  final result = ethClient.sendTransaction(
      credential,
      Transaction.callContract(
          contract: contract, function: ethFunction, parameters: args),
      chainId: null,
      fetchChainIdFromNetworkId: true);
  return result;
}

Future<List<dynamic>> getAllPatient(Web3Client ethClient) async {
  try {
    var response = await callFunction("getAllPatients", [], ethClient);
    return response;
  } catch (e) {
    // log(e);
    return [e];
  }

}

Future<String> registerPatient(
    Web3Client ethClient, String sender, List<dynamic> args) async {
  // to add List<dynamic> args as parameter
  print("sending");

  try {
    var response =
        await transactFunction("registerPatient", args, ethClient, sender);
    print(response);
    return response;
  } catch (e) {

    return e.toString();
  }
}

Future<String> addOCR(
    Web3Client ethClient, String sender, List<dynamic> args) async {
  // to add List<dynamic> args as parameter
  print("sending");

  try {
    var response =
        await transactFunction("addOCRData", args, ethClient, sender);
    print(response);
    return response;
  } catch (e) {
  
    return e.toString();
  }
}


