function I = snapshot
robot = java.awt.Robot(); %创建java.awt.Robot对象robot，自动测试
rectangle = java.awt.Rectangle(); %创建java.awt.Rectangle对象rectangle，矩形
rectangle.x = 1; % 截图左上角横坐标（屏幕最左上角为原点）
rectangle.y = 1; % 截图左上角纵坐标（屏幕最左上角为原点）
rectangle.width = 1920; % 截图宽度（屏幕最左上角为原点）
rectangle.height = 1080; % 截图高度（屏幕最左上角为原点）
image = robot.createScreenCapture(rectangle); %创建包含从屏幕中读取的像素的图像
w = image.getWidth(); %获取图像宽度
h = image.getHeight(); %获取图像高度
raster = image.getData(); %获取图像RGB数据，返回Raster类的对象
I = zeros(w*h*3,1); %创建存储RGB像素信息的double数组
I = raster.getPixels(0,0,w,h,I); %获取图像一维RGB颜色数组
I = uint8(I); %转换成uint8数据类型
I1 = I(1:3:length(I)); %提取R色一维数组
I1 = reshape(I1,w,h); %转换为R色二维数组
I2 = I(2:3:length(I)); %提取G色一维数组
I2 = reshape(I2,w,h); %转换为G色二维数组
I3 = I(3:3:length(I)); %提取B色一维数组
I3 = reshape(I3,w,h); %转换为B色二维数组
I = uint8(zeros(w,h,3)); %创建存储RGB图像信息三维矩阵
I(1:w,1:h,1) = I1; %导入R色数组
I(1:w,1:h,2) = I2; %导入G色数组
I(1:w,1:h,3) = I3; %导入B色数组
I = imrotate(I,-90,'nearest'); %图像顺时针旋转90度
I = flipdim(I,2); %图像竖直镜像
end

