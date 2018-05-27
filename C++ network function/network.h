//network.h
#pragma once
#include <math.h>  
#include <fstream>

double transig(double x) {
	y = 2 / (1 + exp(-2 * x)) - 1;
	return y;
}

//Simulate function updates arrOut, Motor speed as arr(0) and steering angle as arr(1). Coeff should be length 63
//arrIn should be length 7; s1 to s5 and M0 and S0
void sim(double arrIn[], double coeff[], double arrOut[]) {
	int numInptuts = 7;
	int numOutputs = 2;
	int numHidden = 7;
	double arrHidden[numHidden];

	for (int i = 0; i < numHidden; i++) {
		for (int j = 0; j < numInputs; j++) {
			arrHidden[i] = arrHidden[i] + arrIn[j] * coeff[numImputs*i + j];
		}
		arrHidden[i] = transig(arrHidden[i]);
	}

	for (int i = 0; i < numOutputs; i++) {
		for (int j = 0; j < numHidden; j++) {
			arrOut[i] = arrOut[i] + arrHidden[j]*coeff[(numInptuts-1)*(numHidden-1) + numHidden*i + j];
		}
	}
}

//file should be named "coeff.csv"
void loadCoeff(double coeff[]) {
	int val;
	int count = 0;
	ifstream coeffFile("coeff.csv");
	if (coeffFile.open()) {
		while (getline(coeffFile, val, ',')) {
			coeff(count) = val;
			count++;
		}
		coeffFile.close();
	}
	else cout << "file not read" << endl;
}