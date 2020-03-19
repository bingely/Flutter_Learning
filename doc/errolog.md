> I/flutter (10502): The following assertion was thrown during performResize():
  I/flutter (10502): Vertical viewport was given unbounded height.
If this widget is always nested in a scrollable widget there is no need to use a viewport because there will always be enough vertical space for the children.
In this case, consider using a Column instead. Otherwise, consider using the "shrinkWrap" property (or a ShrinkWrappingViewport)
to size the height of the viewport to the sum of the heights of its children.
从异常信息中我们可以看到是因为ListView高度边界无法确定引起，所以解决的办法也很明显

可以使用Expanded自动拉伸组件大小，并且我们也说过Column是继承自Flex的，所以我们可以直接使用Column+Expanded来实现


# 第三方库

# Flutter编译报错:The method 'CachedNetworkImageProvider.load' has fewer positional
https://blog.csdn.net/yinxing2008/article/details/103374996
cached_network_image: ^2.0.0-rc
#
