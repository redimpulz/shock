//クイズアプリ：ロジック

//問題の配列
var ans = ["とり","りんご","DOG","LOVE","しょかく"];
var num = 0;

$("#start").click(function(){
    num=0;
    console.log("start");
    $("form").show();
    $("#quizNum").empty();
    $("#quizNum").append("<b>第1問</b>");
    startQuiz(ans[num]);
})

$("#next").click(function(){
    num++;
    console.log("next");
    $(':text[name="ans1"]').val(""); 
    $('#quizNum').empty();
    if (num==5) {
        $("#quizNum").append("<b>終了！</b>");
        $("form").hide();
        num = 0;
    } else {
        $("#quizNum").append("<b>第"+(num+1)+"問</b>");
    }
    startQuiz(ans[num]);
});

$("#btn1").click(function() {
    if ($(':text[name="ans1"]').val() == ans[num]) {
        alert("正解");
        //$("#result").append("<h3>正解！</h3>");
    } else {
        alert("不正解");
        //$("#result").append("<h3>不正解！</h3>");
    }
});

//ゲームスタート
var startQuiz = function(quiznum){
    $.ajax({
        type: "POST",
        url: "./localhost/text",
        data: ans[quizNum],
    })
    .done(function( data ) {
        // 通信が成功したときの処理
        //console.log("success");
    })
    .fail(function( data ) {
        // 通信が失敗したときの処理
        //console.log("error");
    })
    .always(function( data ) {
        // 通信が完了したとき
        //console.log("finish");
    });
};
