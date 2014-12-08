define(["ace/ace"] ,function(ace){
    var page = {
        init:function(){
            this.getResumeCode();
            this.initAceEditor();
        },
        getResumeCode:function(){
            var _this = this;
            $.ajax({
                type:"get",
                url:"self-introduction.json",
                dataType:"html",
                success:function(res){
                    _this.insertCode(res);
                }
            });
        },
        initAceEditor:function() {
            var editor = ace.edit("editor");
            editor.setTheme("ace/theme/monokai");
            editor.getSession().setMode("ace/mode/json");
            this.editor = editor;
        },
        insertCode:function(code){
            var editor = this.editor;
            //换行作为分隔符产生数组
            var lines = code.split(/\n/),
                max = lines.length-1,
                count = 0;
            var timeID = setInterval(function(){
                if(count>=max){
                    clearInterval(timeID);

                }
                //插入一行后加入换行符
                editor.insert(lines[count]+"\n");
                editor.focus();
                count++;
            }, 80);
        }
    };
    page.init();


});