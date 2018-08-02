//network.h
#pragma once
#include <math.h>  
//#include <fstream>
//#include <iostream>
//#include <string>
using namespace std;

// Sensor 1 -> looking striaght -> arrIn[0] 
// Sensor 2 -> left front
// Sensor 3 -> right front
// Sensor 4 -> left side
// Sensor 5 -> right side -> arrIn[4]
// Current speed -> arrIn[5]
// Current steering angle -> arrIn[6]

double tansig(double x) {
	double y;
	y = (2 / (1 + exp(-2 * x))) - 1;
	return y;
}

//Simulate function updates arrOut, Motor speed as arr(0) and steering angle as arr(1). Coeff should be length 63
//arrIn should be length 7; s1 to s5 and M0 and S0
void sim(double arrIn[], double coeff[], double arrOut[]) {
	int numInputs = 7;
	int numOutputs = 2;
	int numHidden = 7;
	double arrHidden[numHidden];
	

	for (int i = 0; i < numHidden; i++) {
		arrHidden[i]=0;
		for (int j = 0; j < numInputs; j++) {
			arrHidden[i] = arrHidden[i] + arrIn[j] * coeff[numInputs*j + i];
		//cout << "using coeff " << numInputs*j + i <<  endl;
		}
		arrHidden[i] = tansig(arrHidden[i]);
	}

	for (int i = 0; i < numOutputs; i++) {
		arrOut[i]=0;
		for (int j = 0; j < numHidden; j++) {
			arrOut[i] = arrOut[i] + arrHidden[j]*coeff[(numInputs)*(numHidden) + i + 2*j];
		//cout << "using coeff " << (numInputs)*(numHidden) + i + 2*j <<  endl;
		}
	}
}


/*//file should be a csv 
void loadCoeff(double coeff[], string fileName) {
	double val;
	int count = 0;
	ifstream coeffFile;
	coeffFile.open(fileName);
	if (!coeffFile.fail()) {
		while (!coeffFile.eof()) {
			coeffFile >> val;
			coeff[count] = val;
			//cout << coeff[count] << endl;
			count++;
		}
		coeffFile.close();
	}
	else cout << "file not read" << endl;
}*/


