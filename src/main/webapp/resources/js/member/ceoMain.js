const editBtn = $(".edit_btn");
const userInfoContent = $(".user_info_content input");
const userInfoName = $("input[name=user_name]");
const userInfoEmail = $("input[name=user_email]");
const userInfoPw = $("input[name=user_pw]");
const userInfoPhone = $("input[name=user_phone]");

editBtn.on("click",function(){
    userInfoContent.css("border-bottom","1px solid black");
    userInfoContent.attr("disabled",false);
    editBtn.text("완료");
    
    editBtn.on("click",function(){
    editBtn.text("수정");
    userInfoName.val();
    console.log(userInfoContent.val());
    userInfoContent.css("border-bottom","1px solid white");
    userInfoContent.attr("disabled",true);
    });
});