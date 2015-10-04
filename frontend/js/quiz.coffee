# //クイズアプリ：ロジック

# //問題の配列
# 
vans = [
  'とり'
  'りんご'
  'DOG'
  'LOVE'
  'しょかく'
  'くま'
  'なし'
  'CAT'
  'EGG'
  'ゆめ'
  'さかな'
  'いちご'
  'RED'
  'くるま'
  'はな'
  'MILK'
  'ずぼん'
  'やま'
  'かわ'
  'とまと'
  'PEN'
  'ゆき'
  'いぬ'
  'せみ'
]
a = []
q = []
num = 0
q_num = 0
q_num_max = 4
correct = 0
for i in [0..q_num_max]

    q[i] = []
    for j in [0..q_num_max]
        r = Math.floor(Math.random()*vans.length)
        q[i][j] = vans[r]
        vans.splice( r , 1 )
    q[i]
for k in [0..q_num_max]
    s = Math.floor(Math.random()*q_num_max)
    a[k] = q[k][r]
console.log a
console.log q
quiz_fn_after= ()->
    # console.log "agter"
    $("#return").show()
quiz_fn = (a)->
    console.log a
    startQuiz a
    timer = setTimeout(quiz_fn_after,5000);


  # startQuiz ans[num]
$('#to_ans').click ->
    $("#return").hide()
    for i in [0..q_num_max-1]
        # console.log q[q_num][i]
        $("#ans #btn" + i).val(q[q_num][i])
        # $("#ans")[i].val(q[q_num][i])


    $("#ans").show()

$("#repeat").click ->
  $("#return").hide()
  quiz_fn(a[q_num])


$("#ans input").click ->
    # console.log $(this).val()
    if $(this).val() == a[q_num]
        ++correct
        $("#ans_crct").html("正解")
    else
        $("#ans_crct").html("残念、正解は "+a[q_num])
    $("#ans").hide()
    $("#ans_aft").show()
    ++q_num
$('#reload').click ->
    location.reload()
$('#start,#start_next').click ->
  if q_num > q_num_max
    $('#quizNum').hide()
    $("#ans_aft").hide()
    $("#last").show()
    $('#last_msg').html(q_num_max+1 +"問中"+correct+"正解")
    return
  $("#first").hide()
  $("#ans_aft").hide()
  $("#quizNum").show()

  num = 0
  # console.log 'start'
  # $('form').show()q_num
  $("#start").hide()
  $('#quizNum').html("第"+(q_num+1)+"問")
  quiz_fn(a[q_num])
  return
# $('#next').click ->
#   num++
#   console.log 'next'
#   $(':text[name="ans1"]').val ''
#   $('#quizNum').empty()
#   if num == 5
#     $('#quizNum').append '<b>終了！</b>'
#     $('form').hide()
#     num = 0
#   else
#     $('#quizNum').append '<b>第' + q_num + 1 + '問</b>'
#   startQuiz ans[a]
#   return
# $('#btn1').click ->
#   if $(':text[name="ans1"]').val() == ans[num]
#     alert '正解'
#     #$("#result").append("<h3>正解！</h3>");
#   else
#     alert '不正解'
#     #$("#result").append("<h3>不正解！</h3>");
#   return
# #ゲームスタート

startQuiz = (quiznum) ->
  $.ajax(
    type: 'POST'
    url: './localhost/text'
    data: ans[quizNum]).done((data) ->
    # 通信が成功したときの処理
    #console.log("success");
    return
  ).fail((data) ->
    # 通信が失敗したときの処理
    #console.log("error");
    return
  ).always (data) ->
    # 通信が完了したとき
    #console.log("finish");
    return
  return
