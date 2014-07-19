define(["ace/ace"] ,function(ace){
    var page = {
        init:function(){
            this.getResumeCode();
        },
        getResumeCode:function(){
            var _this = this;
            $.ajax({
                type:"get",
                url:"self-introduction.json",
                dataType:"html",
                success:function(res){
                    _this.initAceEditor(res);
                }
            });
        },
        initAceEditor:function(code){
            var editor = ace.edit("editor");
            editor.setTheme("ace/theme/monokai");
            editor.getSession().setMode("ace/mode/json");
            var length = code.length,
                count = 0;

            var timeID = setInterval(function(){
                if(count>=length){
                    clearInterval(timeID);
                }
                var c = code[count];
                if(c != " " && c != "\r"){
                    editor.insert(code[count]);
                }
                count++;
            }, 20);
        }
    };
    page.init();


});