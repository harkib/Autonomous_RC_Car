//test.cpp to test network functions
# include "network.h"
# include <iostream>
using namespace std;


int main() {
	double arrIn[7];
	double coeff[64];
	double arrOut[2];
	
	loadCoeff(coeff,"netCoeffsEvolve_May17_export.csv");
	
	for (int i =0; i < 7 ; i++){
		arrIn[i]=i;
	}

	for (int i =0; i < 2 ; i++){
		arrOut[i]=i;
	}	
	
	sim(arrIn,coeff,arrOut);

	cout << arrOut[0] <<", " << arrOut[1] << endl;

	return 0;
}   