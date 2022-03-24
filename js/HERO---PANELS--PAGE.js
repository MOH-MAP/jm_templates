$(function () {
    var imgPath = $(
      ".journal-content-article[data-analytics-asset-title='Panel-Block-energy-revolution'] .text-panel-img img"
    ).attr("src");
  
    $(
      ".journal-content-article[data-analytics-asset-title='Panel-Block-energy-revolution'] .text-panel-img picture"
    ).css({ "background-image": "url(" + imgPath + ")" });
  
    var panelBlockImgPath = $(
      ".journal-content-article[data-analytics-asset-title='Panel-Block-2'] .text-panel-img img"
    ).attr("src");
  
    $(
      ".journal-content-article[data-analytics-asset-title='Panel-Block-2'] .text-panel-img picture"
    ).css({ "background-image": "url(" + panelBlockImgPath + ")" });
  
    $(
      ".journal-content-article[data-analytics-asset-title='Image-Card-Block'] .img__cardblock picture"
    ).each(function () {
      var imgPath = $(this).find("img").attr("src");
      $(this).css({ "background-image": "url(" + imgPath + ")" });
    });
  });
  