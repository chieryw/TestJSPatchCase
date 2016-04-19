defineClass('TestProtocol', {}, {
    canInitWithRequest: function(request) {
            console.log('当前线程');
            console.log(require('NSThread').currentThread())
            console.log('走了JS修复的protocol方法');
            return true;
    },
})