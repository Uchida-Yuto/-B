<!doctype html>
<html lang="ja">
  <head>
    <?php include("meta.htm"); ?>
      <title>拾得物管理システム</title>
    </head>
    
    <body>
      <?php include("header.htm"); ?>
    <style>

      .flex_test-box {
            background-color: #ddd8d8cf;     /* 背景色指定 */
            padding:  10px;             /* 余白指定 */
            display: flex;              /* フレックスボックスにする */
            justify-content:center;
        }
   
        article {
	          display: flex;
	          margin-bottom: 20px;
	          padding: 20px;
	          border-radius: 5px;
	          box-sizing: border-box;
	          box-shadow: 0 0 5px #999;
        }
	article figure {
		      margin-right: 20px;
		      width: 100px;
		      height: 100px;
	     }
article figure img {
			   min-width: 100px;
			   max-width: 100%;
			   vertical-align: top;
		   }
          </style>

<div class="flex_test-box">
<div class="container">
<div class="row">
<div class="col mt-3">
        <div>
        物品名
        <input type="text" name="key" id="key">
        <button class="btn btn-success" onclick="get_fitem('r','key')">検索</button>
        </div>
    </div>

    <div class="row mt-3">
      <div class="col">
        <span id="r"></span>
      </div>
    </div>

    </div>
  <?php include("footer.htm"); ?>
  <script src="main.js"></script>
</body>
</html>
