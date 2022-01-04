$(function() {

    new uploadPreview({ UpBtn: "upImg", DivShow: "imgdiv", ImgShow: "imgShow" });
    $("#upImg").hide();
    $("#imgShow").on('click',function(){
        $("#upImg").click();
    })


    var bankCardUrl = ctx+"front/chooseBankCard";
    $.ajax({
        type:"POST",
        url:bankCardUrl,
        data:{},
        dataType:"json",
        success:function(data){
            if(data.code == 0){
                $("#bankId").val(data.data.id);
                $(".kaihuhang").html("开户行：<span style='color: blue;'>"+data.data.bankName+"</span>");
                $(".kaihuming").html("开户名：<span style='color: blue;'>"+data.data.handUserName+"</span>");
                $(".kaihudizhi").html("开户行地址：<span style='color: blue;'>"+data.data.openBankAddress+"</span>");
                var length = data.data.bankCardNo.toString().length;
                $('#firstNo').html("<h3>"+data.data.bankCardNo.toString().substring(0,4)+"</h3>");
                $('#secNo').html("<h3>"+data.data.bankCardNo.toString().substring(4,8)+"</h3>");
                $('#thirdNo').html("<h3>"+data.data.bankCardNo.toString().substring(8,12)+"</h3>");
                $('#fourthNo').html("<h3>"+data.data.bankCardNo.toString().substring(12,length)+"</h3>");
                $("#cardImg").attr('src',data.data.bankCardImg);
            }else if(data.code ==500){
                alert("系统繁忙");
            }
        },
        error:function(data){
            alert(data.msg);
        }
    });

    $("#sureSubmit").on("click",function(){
        var options  = {
            url: ctx+"front/add",
            type: 'post',
            success:function(data){
                if(data.code == 0){
                    alert("操作成功,请等待客服审核!");
                }else if(data.code ==500){
                    alert(data.msg);
                }
            },
            error:function(data){
                alert("系统繁忙");
            }
        };
        $("#dataForm").ajaxSubmit(options);

    });

})



