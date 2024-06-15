nl=[];
var API_URL = "http://localhost/probc/c_json.php";

function get_fitem(tag_id, key_id){
  $.getJSON(API_URL, {type:"json", data:"find_item"}, function(j){
    var src = "<table class='table table-success table-striped'><tr><th>大分類</th><th>物品名</th><th>拾得場所</th><th>色</th><th>特徴</th><th>日時</th><th>状態</th><th>操作</th></tr>";
    cnt=0;
    key=$("#"+key_id).val();
    $.each(j, function(i,v){
      if(v["物品名"].indexOf(key)>-1){
        src += "<tr>";
        src += "<td>" + v["分類"] + "</td>";
        src += "<td>" + v["物品名"] + "</td>";
        src += "<td>" + v["拾得場所"] + "</td>";
        src += "<td>" + v["色"] + "</td>";
        src += "<td>" + v["特徴"] + "</td>";
        src += "<td>" + v["変更日時"] + "</td>";
        src += "<td>" + v["変更内容"] + "</td>";
        src += "<td><a href='v_fitem_detail.php?id=" + v["拾得物ID"] + "' class='btn btn-success'>詳細</a></td>";
        src += "</tr>";
        cnt++;
      }
    });
    src += "</table>";
    src = "検索結果：" + cnt + "件" + src;
    $("#"+tag_id).html(src);
  }).fail(function(e){ console.log(e); });
}

function get_fitem_detail(tag_ids, fid){
  $.getJSON(API_URL, {type:"json", data:"find_item_detail", fid:fid}, function(j){
    var src = "<table class='table table-success'>";
    cnt=0;
    v = j["拾得物"];
    src += "<tr><th>分類</th><td>" + v["分類"] + "</td></tr>";
    src += "<tr><th>物品名</th><td>" + v["物品名"] + "</td></tr>";
    src += "<tr><th>拾得場所</th><td>" + v["拾得場所"] + "</td></tr>";
    src += "<tr><th>色</th><td>" + v["色"] + "</td></tr>";
    src += "<tr><th>特徴</th><td>" + v["特徴"] + "</td></tr>";
    if(v["画像"]!=null) src += "<tr><th>画像</th><td><img src='./imgdata/" + v["画像"] + "'></td></tr>";
    src += "</table>";
    var src2 = "<table class='table table-success'><tr><th>日時</th><th>状態</th><th>対応者</th></tr>";
    $.each(j["変更履歴"], function(i,v){
      src2 += "<tr>";
      src2 += "<td>" + v["変更日時"] + "</td>";
      src2 += "<td>" + v["変更内容"] + "</td>";
      src2 += "<td>" + v["氏名"] + "</td>";
      src2 += "</tr>";
    });
    src2 += "</table>";
    $("#"+tag_ids[0]).html(src);
    $("#"+tag_ids[1]).html(src2);
  }).fail(function(e){ console.log(e); });
}

$(function(){
  $(".needs-validation").each(function(i,f){
    f.addEventListener("submit", function(e){
      if(!check_user() || !f.checkValidity()){
        e.preventDefault();
        e.stopPropagation();
      }
      f.classList.add("was-validated");
    }, false);
  });
  $(".user").on("blur", check_user);
  $("select.belongs").each(function(i,s){
    $.getJSON(API_URL, {type:"json", data:"belongs"}, function(j){
      src = "";
      $.each(j, function(i,v){
        src += "<option value='" + v["所属ID"] + "'>" + v["所属名"] + " / " + v["所属分類"] + "</option>";
      });
      $(s).html(src);
    });
  });
  $("select.category").each(function(i,s){
    $.getJSON(API_URL, {type:"json", data:"category"}, function(j){
      src = "";
      $.each(j, function(i,v){
        src += "<option value='" + v["拾得物分類ID"] + "'>" + v["分類"] + " / " + v["物品名"] + "</option>";
      });
      $(s).html(src);
    });
  });
  $.getJSON(API_URL, {type:"json", data:"user"}, function(j){
    $.each(j, function(i,v){
      nl[v["ユーザID"]]=v["氏名"];
    });
  });
});


function check_user(){
  f = true
  $(".user").each(function(i,tag){
    if(nl.includes($(tag).val())){
      $(tag).next(".valid-feedback").html("登録済みのユーザです");
      $(tag).nextAll(".userid").val(nl.indexOf($(tag).val()));
    }else{
      $(tag).next(".valid-feedback").html("<span class='text-danger'>そのユーザは存在しません</span>");
      f = false;
    }
  });
  return f;
}