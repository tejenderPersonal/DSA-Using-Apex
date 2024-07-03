//Reference https://www.geeksforgeeks.org/program-find-minimum-maximum-element-array/

/*

- Building is code just for learning and practice purposes. Geeks for Geeks didn't have code sample of Apex language. (Though java was there)

- Will be adding some extra comments on the code to let newbies to understand the code.

- Will be building it in a way to undestand the actual process behind the scene.

- Will be using the existing Apex Stadnard Libray Classes as less as possible to solve the main issues


*/
 

public with sharing class FindMinimumandMaximumElement {
    
    //Below method is to find the maximum and minumum element on a sorted array of decimal numbers. 
    //but we don't know the order of sort. It can be either ascending or descending.
    
    
    //Liner Comparision Method. The best possible O(n) method.
    
    //[3,1,5,-3,5,12,2]  
    public static Map <String,Decimal> getMinMaxElement(List<Integer> arrayOfInt){

        //WE CAN MAKE A SET FROM ARRAY TO GET ONLY UNIQUE VALUES


        Integer lengthOfArray = arrayOfInt.size();
        Integer maxElement;
        Integer minElement;
        
        Map <String,Decimal> mapOfResult = new Map<String,Decimal>(); //this is map to return the maximum and minimum value
        if(lengthOfArray == 1){
            //if one element then why waste time
            mapOfResult.put('Min', arrayOfInt[0] );
            mapOfResult.put('Max', arrayOfInt[0] );
            return mapOfResult;
        }else if(lengthOfArray > 1){
            //there are atleast two elements
            //intialize max and min
            if(arrayOfInt[0] > arrayOfInt[1]){
                maxElement = arrayOfInt[0];
                minElement = arrayOfInt[1];
            }else if (arrayOfInt[0] < arrayOfInt[1]){
                maxElement = arrayOfInt[01];
                minElement = arrayOfInt[0];
            }

            //now the remaining in loop
            for(Integer i = 2 ; i < lengthOfArray ; i++){

                if(arrayOfInt[i] > maxElement){
                    maxElement = arrayOfInt[i];
                }else if(arrayOfInt[i] < minElement){
                    minElement = arrayOfInt[i];
                }

            }

            
            mapOfResult.put('Min', minElement );
            mapOfResult.put('Max', maxElement );

            return mapOfResult;
        }else if(lengthOfArray == 0){
            return null;
        }else{
            return null;
        }

         
    }
   
   
    public static Map <String,Decimal> mainMethodSortedArray( List<Decimal> sortedArray){ 
         /*
        Logic:
        As the array is already sorted. 
        We will only need to find the sorting order of the array
        Later we can return First as minimum and last as maximum if ascending
        Or vice versa for descending. 

        */

        Map <String,Decimal> mapOfResult = new Map<String,Decimal>(); //this is map to return the maximum and minimum value

        if(sortedArray != null ){ //this is just to make sure that null value is not passed on the method

            //if array has no element  // returning null
            if(sortedArray.isempty()){
                return null;
            }
            
            //if array has one element //we can consider the one element as both max and minimum
            if(sortedArray.size() == 1 ){
                mapOfResult.put('Min', sortedArray[0] );
                mapOfResult.put('Max', sortedArray[0] );
            }

            //What if the user pass an unsorted array. That we will discuss in next method of this class.

            //Now find the order of sorting
            //we can compare the first 2 elements and find the sorting order
            //For this we should have an array of at least 2 elements
            if(sortedArray.size() >= 2 ){

                //To find the max and min we should have the last and first index of sorted array
                Integer lastIndex = sortedArray.size() -1 ;
                Integer firstIndex = 0;


                if (sortedArray[0] >  sortedArray[1] ){
                    //sorting is in descending order
                    mapOfResult.put('Min', sortedArray[lastIndex] );
                    mapOfResult.put('Max', sortedArray[firstIndex] );

                }else{
                    //sorting is in Ascending order
                    mapOfResult.put('Min', sortedArray[firstIndex] );
                    mapOfResult.put('Max', sortedArray[lastIndex] );
                }

            }
            
            system.debug(mapOfResult);
            
            return mapOfResult;

            /*
            We are not using any loop based on length or any variable
            In every case if input is 1 or 1000. we are only checking the first and last elements.
            - Time Complexity - O(1)

            No additional space proportional to the input size is used, so the overall 
            - Space Complexity - O(1)

            */


        }else{

            return null; //the user has passed null on argument //you may pass some infromation using wrapper classes as return data
        }
        
        //End   
    }
}