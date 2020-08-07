% load the ready dataset
s1 = load('ready_dataset.mat', 'images', 'depths');
imgs = s1.images;
dpts = s1.depths;
% loop on each image of the new dataset
for i = 1:size(dpts, 3)
    % pick an image and its depth
    img = imgs(:, :, :, i);
    dpt = dpts(:, :, i);
    % flip left right
    flippedlr_img = fliplr(img);
    flippedlr_dpt = fliplr(dpt);
    % flip up down
    flippedud_img = flipud(img);
    flippedud_dpt = flipud(dpt);
    % flip up down for the lr
    flippedlrud_img = flipud(flippedlr_img);
    flippedlrud_dpt = flipud(flippedlr_dpt);
    if(i == 1)
        % concatenate augmented images along with the original one
        %        cat(dim, A1, A2, ..., An) 
        images = cat(4, img,flippedlr_img,flippedud_img, flippedlrud_img);
        depths = cat(3, dpt,flippedlr_dpt,flippedud_dpt, flippedlrud_dpt);
    else
        % concatenate augmented images along with the original one on older
        %   saved images.
        images = cat(4, images, img, flippedlr_img, flippedud_img, flippedlrud_img);
        depths = cat(3, depths, dpt, flippedlr_dpt, flippedud_dpt, flippedlrud_dpt);
    end
end
% update the dataset with the new added images
save('agmented_dataset.mat', 'images', 'depths');