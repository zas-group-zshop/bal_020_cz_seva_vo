<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailRecommendedItems.ascx.cs" Inherits="ZASshop.NET.App_UserControls.ProductDetailRecommendedItems" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
<div class="ProductListPicture">
    <h2 class="text-center"><span class="orange">Oblíbené</span> zboží</h2>
    <asp:HyperLink ID="hpLeft" CssClass="recommendLeft" Visible="false" runat="server" />
    <asp:PlaceHolder ID="phOutTips" runat="server" />
    <asp:HyperLink ID="hpRight" CssClass="recommendRight" Visible="false" runat="server" />
</div>
</asp:Panel>