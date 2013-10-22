UILabelBackground
=================

a category that simplifies the unjustifiably hard way of adding a background to a UILabel that spans multiple lines.

Note: for this to work, make sure you set `Lines` as 0 in the the UILabel's attributes inspector in the storyboard.

For a brief explanation of how NSConstraitns work.. take a look at my answer [here](http://stackoverflow.com/a/19244622/766570)

**sample usage:**

```obj-c
// don't worry about setting the frame, constraints will take care of sizing the label for you
UILabel *label = [UILabel new];
label.text = @"hello world";
// leaving a constraint as nil simply means there is no constraint for that particular paramater
[self.serverMessage addBackgroundWithColor:[UIColor grey]
                                parentView:self.view
                                    margin:@10 topConstraint:@273 bottomConstraint:nil leftConstraint:@35 rightConstraint:@35];
```
