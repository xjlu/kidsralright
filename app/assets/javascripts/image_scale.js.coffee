
window.ScaleImage = (srcwidth, srcheight, targetwidth, targetheight, fLetterBox) ->
    result = { width: 0, height: 0, fScaleToTargetWidth: true }

    if ((srcwidth <= 0) || (srcheight <= 0) || (targetwidth <= 0) || (targetheight <= 0))
      return result;

    # scale to the target width
    scaleX1 = targetwidth
    scaleY1 = (srcheight * targetwidth) / srcwidth

    # scale to the target height
    scaleX2 = (srcwidth * targetheight) / srcheight
    scaleY2 = targetheight

    # now figure out which one we should use
    fScaleOnWidth = (scaleX2 > targetwidth)
    if fScaleOnWidth
      fScaleOnWidth = fLetterBox
    else
      fScaleOnWidth = !fLetterBox

    if fScaleOnWidth
      result.width = Math.floor(scaleX1)
      result.height = Math.floor(scaleY1)
      result.fScaleToTargetWidth = true
    else
      result.width = Math.floor(scaleX2)
      result.height = Math.floor(scaleY2)
      result.fScaleToTargetWidth = false
    result.targetleft = Math.floor((targetwidth - result.width) / 2)
    result.targettop = Math.floor((targetheight - result.height) / 2)

    return result;

window.OnImageLoad = (evt) ->
    img = evt.currentTarget
    # what's the size of this image and it's parent
    w = $(img).width()
    h = $(img).height()
    tw = $(img).parent().width()
    th = $(img).parent().height()

    # compute the new size and offsets
    result = ScaleImage(w, h, tw, th, false)

    # adjust the image coordinates and size
    img.width = result.width
    img.height = result.height
    $(img).css("left", result.targetleft)
    $(img).css("top", result.targettop);
    