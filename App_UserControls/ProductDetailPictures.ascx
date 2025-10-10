<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailPictures.ascx.cs" Inherits="ZASshop.NET.App_UserControls.ProductDetailPictures" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<div class="product-main-photo">
<span class="new-badge">
  <%# EvalDataFromXml("odznaky_html") %>
</span>
    <div class="product-image-btns">
        <asp:PlaceHolder runat="server" Visible='<%# System.IO.File.Exists(HttpContext.Current.Server.MapPath("~/App_Firma/Data/360/"+EvalDataFromXml("id_nomen")+"/iframe.html")) %>'>
        <span class="product-image-btn btn-show-360"></span>
        </asp:PlaceHolder>
        <asp:PlaceHolder runat="server" Visible='<%# ExistingRepeaters.Contains(",zrepVideos_firm,") %>'>
        <span class="product-image-btn btn-show-video"></span>
        </asp:PlaceHolder>
    </div>
    <div class="product-gallery-open <%: ZASutility.MyUtility.StringToNumeric(EvalDataFromXml("web_items_cena_s_dph"))>1000 ? "delivery-free" : "" %>">
        <asp:HyperLink ID="hpMainPicture" runat="server">
            <asp:Image ID="imgMainPicture" runat="server" />
        </asp:HyperLink>
    </div>

    <!-- repeater s malými náhledy (_firm1); budou tu jen obrázky, ne videa ani 360 videa; každý slide má data-image atribut, je to jen počítadlo a počítá se od nuly -->
    <div class="slider product-detail-slider">
        <asp:Repeater ID="rProductDetailPictures_firm1" runat="server"
            OnItemCommand="rProductDetailPictures_ItemCommand" >
            <ItemTemplate>
                <div class="product-slide" data-image="<%# Container.ItemIndex %>">
                    <img src="<%# DataBinder.Eval(Container.DataItem, "web_items_preview_file") %>" alt="">
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

<div class="modal-gallery hidden">
    <div class="modal-popup modal-gallery-popup">
        <div class="modal-desc">
            <div class="modal-title"><%= EvalDataFromXml("nazev") %> <a id="js-close-gallery" class="button btn btn-default btn-sm">Zavřít</a></div>
        </div>
        <div class="modal-gallery-inner">
            <div class="modal-gallery-canvas"></div>
            <div class="modal-gallery-slides">
                <div class="modal-gallery-slides-inner">
                    <ul>
                        <!-- Těch 360 videí a youtube videí může být víc, každé video = jedno <li> -->
                        <!-- Ideálně to řadit tak, že nejprve budou 360 videa, poté youtube videa a nakonec normální obrázky -->

                        <asp:PlaceHolder runat="server" Visible='<%# System.IO.File.Exists(HttpContext.Current.Server.MapPath("~/App_Firma/Data/360/"+EvalDataFromXml("id_nomen")+"/iframe.html")) %>'>
                        <li data-type="360"><img src="<%: EvalDataFromXml("web_items_preview_file") %>" alt="Miniatura"></li> 
                        </asp:PlaceHolder>

                        <!-- videa -->
                        <zas:ZasRepeater ID="zrepVideos_firm" runat="server" XmlDataSource="nomenklatura_detail/video_items" XmlDataSourceItemName="video_item" >
                          <ItemTemplate>
                        <li data-type="youtube" data-video="<%# DataBinder.Eval(Container.DataItem, "html_kod") %>"><img src="https://img.youtube.com/vi/<%# DataBinder.Eval(Container.DataItem, "html_kod") %>/0.jpg" alt="Miniatura"></li>
                          </ItemTemplate>
                        </zas:ZasRepeater>

                        <asp:Repeater ID="rProductDetailPictures" runat="server"
                            OnItemCommand="rProductDetailPictures_ItemCommand" >
                            <ItemTemplate>
                                <li data-type="image" data-image="<%# DataBinder.Eval(Container.DataItem, "web_items_full_file") %>">
                                    <img src="<%# DataBinder.Eval(Container.DataItem, "web_items_preview_file") %>" alt="">
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    // v adresáři /App_Firma/Data/360/' + ID_NOMEN ... bude soubor iframe.html, coz je 360 pro danou polozku
    var src360 = "<%: EvalDataFromXml("id_nomen") %>";

    function showPopupGallery() {
        $(".modal-gallery").removeClass("hidden");
    }

    $(function() {

        $(document).on('click', '#js-close-gallery', function() {
            $(".modal-gallery").addClass("hidden");
            canvas.html('');
        })

        $(document).on('click', ".modal-gallery-slides li", function() {
            canvas.html('');
            var parent = $(this).parent();
            var type = $(this).data("type");
            $(".active", parent).removeClass("active");
            $(this).addClass("active");
            // $(".modal-gallery-slides").scrollTop($(".modal-gallery-slides").scrollTop()+$(".modal-gallery-slides li.active").position().top);    

            if(type == "image") {
                var src = $(this).data("image");
                console.debug( canvas );
                canvas.html("<img src='" + src + "' />");
            }

            if(type == "360") {
                canvas.html('<div class="embed-360"><iframe name="3drt-my360View" allowfullscreen="true" marginheight="0" marginwidth="0" scrolling="no" src="/App_Firma/Data/360/' + src360 + '/iframe.html" width="400" height="300"><p>Your browser does not support iframes.</p></iframe></div>')
            }

            if(type == "youtube") {
                var src = $(this).data("video");
                canvas.html('<div class="embed-360"><iframe width="420" height="315"src="https://www.youtube.com/embed/' + src + '?autoplay=1"></iframe></div>');
            }
        });

        $(document).on('click', '.product-gallery-open img', function(e) {
            e.preventDefault();
            $(".modal-gallery-slides li:first-child").trigger('click');
            showPopupGallery();
        });

        $(document).on('click', '.btn-show-360', function() {
            $(".modal-gallery-slides [data-type='360']").first().trigger('click');
            showPopupGallery();
        });

        $(document).on('click', '.btn-show-video', function() {
            $(".modal-gallery-slides [data-type='youtube']").first().trigger('click');
            showPopupGallery();
        });

        $(document).on('click', '.product-slide', function() {
            var image = $(this).data('image');
            var target = $(".modal-gallery-slides li[data-type='image']").eq(image);
            target.trigger('click');
            showPopupGallery();
        });

    }); 
</script>