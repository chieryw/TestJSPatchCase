defineClass('ViewController', {
    firstAction: function(sender) {
        var temp = 1;
        while (temp < 100) {
            console.log('开始网络请求');
            var test = require('DDNetwork').new();
            test.startTest();
            temp ++
        }
    },
    secondAction: function(sender) {
        console.log('开始网络请求');
        var test = require('DDNetwork').new();
        test.startTest();
    }
})