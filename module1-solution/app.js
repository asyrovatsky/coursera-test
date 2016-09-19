(function(){ 'use strict';

  angular.module('LunchCheck', [])
  .controller('LunchCheckController', LunchCheckController);

  LunchCheckController.$inject = ['$scope'];

  function LunchCheckController($scope){
    $scope.message = "" ;
    $scope.messageClass = "";

    $scope.showMessage = function(){
      var count = countDishes($scope.dishes);
      if (count == 0){
        $scope.message = "Please enter data first" ;
        $scope.messageClass = "red";
      } else if(count <= 3){
        $scope.message = "Enjoy!";
        $scope.messageClass = "green";
      } else {
        $scope.message = "Too much!";
        $scope.messageClass = "green";
      }
    };

    function countDishes(value){
      if (!value)
        return 0;
      return value
              .split(",")
              .map(function(s){ return s.trim(); })
              .filter(function(s){ return s != ""; })
              .length
    }
  }
})();
