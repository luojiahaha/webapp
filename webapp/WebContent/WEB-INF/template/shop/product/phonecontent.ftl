<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
[@seo type = "productContent"]
	<title>[#if product.seoTitle??]${product.seoTitle}[#elseif seo.title??][@seo.title?interpret /][/#if][#if systemShowPowered] - Powered By LFX[/#if]</title>
	<meta name="author" content="LFX Team" />
	<meta name="copyright" content="LFX" />
	[#if product.seoKeywords??]
		<meta name="keywords" content="${product.seoKeywords}" />
	[#elseif seo.keywords??]
		<meta name="keywords" content="[@seo.keywords?interpret /]" />
	[/#if]
	[#if product.seoDescription??]
		<meta name="description" content="${product.seoDescription}" />
	[#elseif seo.description??]
		<meta name="description" content="[@seo.description?interpret /]" />
	[/#if]
[/@seo]
<link href="${base}/resources/shop/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/shop/css/product.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${base}/resources/shop/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.tools.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.jqzoom.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/jquery.validate.js"></script>
<script type="text/javascript" src="${base}/resources/shop/js/common.js"></script>
<script type="text/javascript">
$().ready(function() {

	var $historyProduct = $("#historyProduct ul");
	var $clearHistoryProduct = $("#clearHistoryProduct");
	var $zoom = $("#zoom");
	var $scrollable = $("#scrollable");
	var $thumbnail = $("#scrollable a");
	var $specification = $("#specification dl");
	var $specificationTitle = $("#specification div");
	var $specificationValue = $("#specification a");
	var $productNotifyForm = $("#productNotifyForm");
	var $productNotify = $("#productNotify");
	var $productNotifyEmail = $("#productNotify input");
	var $addProductNotify = $("#addProductNotify");
	var $quantity = $("#quantity");
	var $increase = $("#increase");
	var $decrease = $("#decrease");
	var $addCart = $("#addCart");
	var $addFavorite = $("#addFavorite");
	var $window = $(window);
	var $bar = $("#bar ul");
	var $introductionTab = $("#introductionTab");
	var $parameterTab = $("#parameterTab");
	var $reviewTab = $("#reviewTab");
	var $consultationTab = $("#consultationTab");
	var $introduction = $("#introduction");
	var $parameter = $("#parameter");
	var $review = $("#review");
	var $addReview = $("#addReview");
	var $consultation = $("#consultation");
	var $addConsultation = $("#addConsultation");
	var barTop = $bar.offset().top;
	var productMap = {};
	[@compress single_line = true]
		productMap[${product.id}] = {
			path: null,
			specificationValues: [
				[#list product.specificationValues as specificationValue]
					"${specificationValue.id}"[#if specificationValue_has_next],[/#if]
				[/#list]
			]
		};
		[#list product.siblings as product]
			productMap[${product.id}] = {
				path: "${product.path}",
				specificationValues: [
					[#list product.specificationValues as specificationValue]
						"${specificationValue.id}"[#if specificationValue_has_next],[/#if]
					[/#list]
				]
			};
		[/#list]
	[/@compress]
	
	// 锁定规格值
	lockSpecificationValue();
	
	// 商品图片放大镜
	$zoom.jqzoom({
		zoomWidth: 368,
		zoomHeight: 368,
		title: false,
		showPreload: false,
		preloadImages: false
	});
	
	// 商品缩略图滚动
	$scrollable.scrollable();
	
	$thumbnail.hover(function() {
		var $this = $(this);
		if ($this.hasClass("current")) {
			return false;
		} else {
			$thumbnail.removeClass("current");
			$this.addClass("current").click();
		}
	});
	
	// 规格值选择
	$specificationValue.click(function() {
		var $this = $(this);
		if ($this.hasClass("locked")) {
			return false;
		}
		$this.toggleClass("selected").parent().siblings().children("a").removeClass("selected");
		var selectedIds = new Array();
		$specificationValue.filter(".selected").each(function(i) {
			selectedIds[i] = $(this).attr("val");
		});
		var locked = true;
		$.each(productMap, function(i, product) {
			if (product.specificationValues.length == selectedIds.length && contains(product.specificationValues, selectedIds)) {
				if (product.path != null) {
					location.href = "${base}" + product.path;
					locked = false;
				}
				return false;
			}
		});
		if (locked) {
			lockSpecificationValue();
		}
		$specificationTitle.hide();
		return false;
	});
	
	// 锁定规格值
	function lockSpecificationValue() {
		var selectedIds = new Array();
		$specificationValue.filter(".selected").each(function(i) {
			selectedIds[i] = $(this).attr("val");
		});
		$specification.each(function() {
			var $this = $(this);
			var selectedId = $this.find("a.selected").attr("val");
			var otherIds = $.grep(selectedIds, function(n, i) {
				return n != selectedId;
			});
			$this.find("a").each(function() {
				var $this = $(this);
				otherIds.push($this.attr("val"));
				var locked = true;
				$.each(productMap, function(i, product) {
					if (contains(product.specificationValues, otherIds)) {
						locked = false;
						return false;
					}
				});
				if (locked) {
					$this.addClass("locked");
				} else {
					$this.removeClass("locked");
				}
				otherIds.pop();
			});
		});
	}
	
	// 判断是否包含
	function contains(array, values) {
		var contains = true;
		for(i in values) {
			if ($.inArray(values[i], array) < 0) {
				contains = false;
				break;
			}
		}
		return contains;
	}
	
	// 到货通知
	$addProductNotify.click(function() {
		[#if product.specifications?has_content]
			var specificationValueIds = new Array();
			$specificationValue.filter(".selected").each(function(i) {
				specificationValueIds[i] = $(this).attr("val");
			});
			if (specificationValueIds.length != ${product.specificationValues?size}) {
				$specificationTitle.show();
				return false;
			}
		[/#if]
		if ($addProductNotify.val() == "${message("shop.product.addProductNotify")}") {
			$addProductNotify.val("${message("shop.product.productNotifySubmit")}");
			$productNotify.show();
			$productNotifyEmail.focus();
			if ($.trim($productNotifyEmail.val()) == "") {
				$.ajax({
					url: "${base}/product_notify/email.jhtml",
					type: "GET",
					dataType: "json",
					cache: false,
					success: function(data) {
						$productNotifyEmail.val(data.email);
					}
				});
			}
		} else {
			$productNotifyForm.submit();
		}
		return false;
	});
	
	// 到货通知表单验证
	$productNotifyForm.validate({
		rules: {
			email: {
				required: true,
				email: true
			}
		},
		submitHandler: function(form) {
			$.ajax({
				url: "${base}/product_notify/save.jhtml",
				type: "POST",
				data: {productId: ${product.id}, email: $productNotifyEmail.val()},
				dataType: "json",
				cache: false,
				beforeSend: function() {
					$addProductNotify.prop("disabled", true);
				},
				success: function(data) {
					if (data.message.type == "success") {
						$addProductNotify.val("${message("shop.product.addProductNotify")}");
						$productNotify.hide();
					}
					$.message(data.message);
				},
				complete: function() {
					$addProductNotify.prop("disabled", false);
				}
			});
		}
	});
	
	// 购买数量
	$quantity.keypress(function(event) {
		var key = event.keyCode ? event.keyCode : event.which;
		if ((key >= 48 && key <= 57) || key==8) {
			return true;
		} else {
			return false;
		}
	});
	
	// 增加购买数量
	$increase.click(function() {
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity)) {
			$quantity.val(parseInt(quantity) + 1);
		} else {
			$quantity.val(1);
		}
	});
	
	// 减少购买数量
	$decrease.click(function() {
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 1) {
			$quantity.val(parseInt(quantity) - 1);
		} else {
			$quantity.val(1);
		}
	});
	
	// 加入购物车
	$addCart.click(function() {
		[#if product.specifications?has_content]
			var specificationValueIds = new Array();
			$specificationValue.filter(".selected").each(function(i) {
				specificationValueIds[i] = $(this).attr("val");
			});
			if (specificationValueIds.length != ${product.specificationValues?size}) {
				$specificationTitle.show();
				return false;
			}
		[/#if]
		var quantity = $quantity.val();
		if (/^\d*[1-9]\d*$/.test(quantity) && parseInt(quantity) > 0) {
			$.ajax({
				url: "${base}/cart/add.jhtml",
				type: "POST",
				data: {id: ${product.id}, quantity: quantity},
				dataType: "json",
				cache: false,
				success: function(message) {
					$.message(message);
				}
			});
		} else {
			$.message("warn", "${message("shop.product.quantityPositive")}");
		}
	});
	
	// 添加商品收藏
	$addFavorite.click(function() {
		$.ajax({
			url: "${base}/member/favorite/add.jhtml?id=${product.id}",
			type: "POST",
			dataType: "json",
			cache: false,
			success: function(message) {
				$.message(message);
			}
		});
		return false;
	});
	
	$window.scroll(function() {
		var scrollTop = $(this).scrollTop();
		if (scrollTop > barTop) {
			if (window.XMLHttpRequest) {
				$bar.css({position: "fixed", top: 0});
			} else {
				$bar.css({top: scrollTop});
			}
			var introductionTop = $introduction.size() > 0 ? $introduction.offset().top - 36 : null;
			var parameterTop = $parameter.size() > 0 ? $parameter.offset().top - 36 : null;
			var reviewTop = $review.size() > 0 ? $review.offset().top - 36 : null;
			var consultationTop = $consultation.size() > 0 ? $consultation.offset().top - 36 : null;
			if (consultationTop != null && scrollTop >= consultationTop) {
				$bar.find("li").removeClass("current");
				$consultationTab.addClass("current");
			} else if (reviewTop != null && scrollTop >= reviewTop) {
				$bar.find("li").removeClass("current");
				$reviewTab.addClass("current");
			} else if (parameterTop != null && scrollTop >= parameterTop) {
				$bar.find("li").removeClass("current");
				$parameterTab.addClass("current");
			} else if (introductionTop != null && scrollTop >= introductionTop) {
				$bar.find("li").removeClass("current");
				$introductionTab.addClass("current");
			}
		} else {
			$bar.find("li").removeClass("current");
			$bar.css({position: "absolute", top: barTop});
		}
	});
	
	[#if setting.isReviewEnabled && setting.reviewAuthority != "anyone"]
		// 发表商品评论
		$addReview.click(function() {
			if ($.checkLogin()) {
				return true;
			} else {
				$.redirectLogin("${base}/review/add/${product.id}.jhtml", "${message("shop.product.addReviewNotAllowed")}");
				return false;
			}
		});
	[/#if]
	
	[#if setting.isConsultationEnabled && setting.consultationAuthority != "anyone"]
		// 发表商品咨询
		$addConsultation.click(function() {
			if ($.checkLogin()) {
				return true;
			} else {
				$.redirectLogin("${base}/consultation/add/${product.id}.jhtml", "${message("shop.product.addConsultationNotAllowed")}");
				return false;
			}
		});
	[/#if]
	
	// 浏览记录
	var historyProduct = getCookie("historyProduct");
	var historyProductIds = historyProduct != null ? historyProduct.split(",") : new Array();
	for (var i = 0; i < historyProductIds.length; i ++) {
		if (historyProductIds[i] == "${product.id}") {
			historyProductIds.splice(i, 1);
			break;
		}
	}
	historyProductIds.unshift("${product.id}");
	if (historyProductIds.length > 6) {
		historyProductIds.pop();
	}
	addCookie("historyProduct", historyProductIds.join(","), {path: "${base}/"});
	$.ajax({
		url: "${base}/product/history.jhtml",
		type: "GET",
		data: {ids: historyProductIds},
		dataType: "json",
		traditional: true,
		cache: false,
		success: function(data) {
			$.each(data, function (index, product) {
				var thumbnail = product.thumbnail != null ? product.thumbnail : "${setting.defaultThumbnailProductImage}";
				$historyProduct.append('<li><img src="' + thumbnail + '" \/><a href="${base}' + product.path + '">' + product.name + '<\/a><span>' + currency(product.price, true) + '<\/span><\/li>');
			});
		}
	});
	
	// 清空浏览记录
	$clearHistoryProduct.click(function() {
		$historyProduct.empty();
		$(this).text("${message("shop.product.noHistoryProduct")}");
		removeCookie("historyProduct", {path: "${base}/"});
	});
	
	// 点击数
	$.ajax({
		url: "${base}/product/hits/${product.id}.jhtml",
		type: "GET"
	});
	
});
</script>
</head>
<body>
	${product.name}
	
</body>
</html>