package main

import (
	"fmt"
	"lqy/controller"
	"net/http"
)

func main() {
	// 处理静态资源路径
	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("views/static/"))))
	http.Handle("/pages/", http.StripPrefix("/pages/", http.FileServer(http.Dir("views/pages/"))))

	http.HandleFunc("/", controller.IndexHandle1)
	http.HandleFunc("/login", controller.LoginHandle)
	http.HandleFunc("/logout", controller.LogoutHandle)
	http.HandleFunc("/register", controller.RegisterHandle)
	http.HandleFunc("/checkUsername", controller.CheckUsername)

	//获取所有图书

	http.HandleFunc("/getPageBooks", controller.GetPageBooks) //获取分页书籍
	http.HandleFunc("/addBook", controller.AddBook)           //新增书籍
	http.HandleFunc("/delBook", controller.DelBook)           //删除书籍
	http.HandleFunc("/toEditPage", controller.ToEditPage)     //编辑分页书籍
	http.HandleFunc("/editBook", controller.EditBook)         //编辑书籍
	http.HandleFunc("/modifyBook", controller.ModifyBook)     //编辑分页书籍
	//用户
	http.HandleFunc("/manageUser", controller.GetUser)                  //管理用户
	http.HandleFunc("/delUser", controller.DelUser)                     //删除用户
	http.HandleFunc("/registerManage", controller.RegisterManageHandle) //注册管理

	fmt.Println("服务开启成功：地址为", "http://127.0.0.1:8080") //首页
	http.ListenAndServe(":8080", nil)
}
