import numpy as np
import scipy.io as sio
import SimpleITK as sitk
n = 8
Iimg = []
for i in range(n):
    img = sio.loadmat('Data\\Iimg'+str(i)+'.mat')['Img']
    Iimg.append(img)
Iimg = np.concatenate(Iimg, axis=0)
itkImage = sitk.GetImageFromArray(Iimg.astype(np.float32), isVector=False)
sitk.WriteImage(itkImage, 'Data//fixImg.nii.gz')


n = 8
Eimg = []
for i in range(n):
    img = sio.loadmat('Data\\Eimg'+str(i)+'.mat')['Img']
    Eimg.append(img)
Eimg = np.concatenate(Eimg, axis=0)
itkImage = sitk.GetImageFromArray(Eimg.astype(np.float32), isVector=False)
sitk.WriteImage(itkImage, 'Data//movingImg.nii.gz')