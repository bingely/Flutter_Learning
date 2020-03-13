
先写静态页面
再通过动态数据渲染页面


需要控制器的得写controller

# 首页
sliver 东西要会用
SmartRefresher(
    child: CustomScrollView(
        slivers:[
            SliverToBoxAdapter(),
            SliverAppBar(),
            // 判断
            SliverToBoxAdapter（），
            HomeTopArticleList(),
            HomeArticleList(),
        ]
    )
}
# 项目
ui :
scaffold(appBar:AppBar(title:Stack(下拉组件,TabBar)) + body:TabBarView)



TabBarView 下面布局就是
根据状态 显示不同布局
先异常布局：

否则正常布局：

SmartRefresher ( child:ListView)

ListView 每个item布局：
Stack（
  // 1
  Colum(
    Row(
        ClipOval(child:WrapperImage（是对CachedNetworkImage的封装空间）),
        Text('用户名'),
        Expanded(child: SizedBox.shrink(),), // 用于填充之间的空白空间--可变
        Text('time')
    )
    Row(
        Column(
            ArticleTitleWidget（封装了htlml格式的），
            SizedBox（用于控制间隔），
            Text()
        ),
        WrapperImag()
    )
  )

  // 2 点赞按钮
  Positioned(
    bottom: 0,
    right: 0,
    child: Padding（
        Hero（
            ScaleAnimatedSwitcher （child:SizedBox(CupertinoActivityIndicator):Icon)
            ）
        ）
  )

）

## tag
Container(
    decoration:BoxDecoration
    child: Text()
)
> 它之所以抽取成一个公共的小组件，因为里面有可以变化的元素，比如控制边框颜色等等。


# 体系
## item
Column(
    Text(

    ),
    Wrap(
        children: [
            ActionChip(
                label:Text()
            )
        ]
    )
)

# 我的
Scaffold(
    body：CustomScrollView（
             slivers:[
                SliverAppBar(),
                UserListWidget(
                    child: SliverList(
                        delegate:[
                            ListTile(
                                title,onTap,leading,
                                trailing:
                            )
                        ]
                    )

                )
             ]
         ）
)

## ios radiobutton
CupertinoSwitch(

)
