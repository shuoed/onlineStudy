<link href="/res/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="/res/css/reset.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/res/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/res/js/jquery.form.js"></script>
<script type="text/javascript" src="/res/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/res/js/oc.min.js"></script>

<!--[if lt IE 9]>
  <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<link rel="icon" type="image/png" href="/res/i/ico.png" sizes="16x16">

<script type="text/javascript">
    CONTEXT_PATH = '/';

<@shiro.guest>
SHIRO_LOGIN = false;
</@shiro.guest>

<@shiro.user>
SHIRO_LOGIN = true;//是否已经登录
</@shiro.user>

     // $(function(){
     //     // 设置jQuery Ajax全局的参数
     //     $.ajaxSetup({
     //         type: "POST",
     //         complete:function(xhr,status){
     //             if(xhr.responseJSON.errcode == 1001){//登录超时
     //                 window.location.href=CONTEXT_PATH+"/auth/login";
     //             }
     //         }
     //     });
     // });
</script>

