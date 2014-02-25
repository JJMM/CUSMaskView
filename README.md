CUSMaskView
===========

Only a flash for UILabel that refer to three20.<br>
The label effect is similar to unlock iphone screen.
We will add more controls to the project.<br>
please pay attention to add Star, your support is my greatest motivation, thank you.<br>
<br>
![image](https://github.com/JJMM/CUSResources/raw/master/CUSMaskView.gif)

## START
Use CUSFlashLabel just like UILable
```objective-c
CUSFlashLabel *label = [[CUSFlashLabel alloc]initWithFrame:CGRectMake(20, 80, 300, 50)];
[label setText:@"Test Label0"];
[label setFont:[UIFont systemFontOfSize:15]];
[label setContentMode:UIViewContentModeTop];
[label startAnimating];
[view addSubview:label];
```

## License
CUSSender is available under the Apache 2.0 license. See the LICENSE file for more info.