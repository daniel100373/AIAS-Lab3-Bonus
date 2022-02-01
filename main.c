#include<stdio.h>
#include <stdlib.h>
typedef int bool;
#define false 0  
#define true  1  

bool validMountainArray(int* arr, int arrSize);
void printResult(int* arr, int arrSize,bool isValid);

int main()
{
	int arr1[] = { 1,2,3,4,5,6,5,4,3,2,1 };
	int arr1Size = 11;
	int arr2[] = { 0, 3, 2, 1 };
	int arr2Size = 4;
	int arr3[] = { 2, 3, 5, 5, 6 };
	int arr3Size = 5;
	bool isVaild = validMountainArray(arr1,arr1Size);
	printResult(arr1, arr1Size, isVaild);
	isVaild = validMountainArray(arr2, arr2Size);
	printResult(arr2, arr2Size, isVaild);
	isVaild = validMountainArray(arr3, arr3Size);
	printResult(arr3, arr3Size, isVaild);
	return 0;
}
bool validMountainArray(int* arr, int arrSize) {
	if (arrSize < 3)
		return false;
	int i = 1;
	while (i < arrSize && (arr[i] > arr[i - 1]))
		i += 1;
	if (i == arrSize || i == 1)
		return false;
	while (i < arrSize && (arr[i] < arr[i - 1]))
		i += 1;
	return i == arrSize;
	
}
void printResult(int* arr, int arrSize,bool isValid) {
	printf("The array is ");
	printf("[");
	for (int i = 0; i < arrSize; i++) {
		printf("%d ", arr[i]);
	}
	printf("%s\n", "]");
	printf("%s\n", "Is it the valid mountain array ?");
	if (isValid)
		printf("%s\n", "True");
	else
		printf("%s\n", "False");
	return;
}