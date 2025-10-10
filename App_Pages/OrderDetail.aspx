<%@ Page Language="C#" MasterPageFile="~/ZASshop.Master" AutoEventWireup="true" CodeBehind="OrderDetail.aspx.cs" Inherits="ZASshop.NET.OrderDetail" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ZasShopBodyPlaceHolder" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <div class="dynamicPopulate_Updating">
                        
                    </div>
                </ProgressTemplate>
            </asp:UpdateProgress>

            <!-- pageDesc -->
            <div class="pageDesc page-description">
                <h1><asp:Literal ID="lh1" runat="server" Text="<%$ Resources: Resource, PageOrderDetailTitleAll %>"></asp:Literal></h1>
                <asp:Panel ID="pDescription" runat="server" CssClass="page-description-text">
                    <strong><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, PageOrderDetailStatus %>" /></strong>
                    <asp:Label ID="lStavObj" runat="server" CssClass="zasOrderStatus" />
                </asp:Panel>
            </div>

            <asp:FormView ID="dvOrderDetail" runat="server" RenderOuterTable="false" >
                <ItemTemplate>

                    <div class="row">
                        <div class="col-md-3">
                            <!-- zasOrderAddress -->
                            <div class="zasOrderAddress">
                                <div class="zasOrderAdressTitle h1"><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, PageOrderDetailAD %>" /></div>
                                <div class="zasOrderAdressBox">
                                <strong><%# DataBinder.Eval(Container.DataItem, "ad_nazev")%></strong><br />
                                <%# DataBinder.Eval(Container.DataItem, "ad_ulice")%><br />
                                <%# DataBinder.Eval(Container.DataItem, "ad_mesto")%>, <%# DataBinder.Eval(Container.DataItem, "ad_psc")%><br />
                                <%# DataBinder.Eval(Container.DataItem, "ad_stat")%><br /><br />
                                <asp:Literal ID="l2" runat="server" Text="<%$ Resources: Resource, AddressContact %>" />: <%# DataBinder.Eval(Container.DataItem, "ad_kontaktni_osoba") %><br />
                                <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "ad_telefon").ToString()) || !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "ad_mobil").ToString()) ? Resources.Resource.AddressPhone + ": " : ""%>
                                <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "ad_telefon").ToString()) ? DataBinder.Eval(Container.DataItem, "ad_telefon_preset").ToString() : ""%>&nbsp;<%# DataBinder.Eval(Container.DataItem, "ad_telefon")%>
                                <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "ad_telefon").ToString()) && !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "ad_mobil").ToString()) ? ", " : ""%>
                                <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "ad_mobil").ToString()) ? DataBinder.Eval(Container.DataItem, "ad_mobil_preset").ToString() : ""%> <%# DataBinder.Eval(Container.DataItem, "ad_mobil")%><br />
                                </div>
                            </div>
                            <!-- /zasOrderAddress -->
                        </div>

                        <div class="col-md-3">
                            <!-- zasOrderAddress -->
                            <div class="zasOrderAddress">
                                <div class="zasOrderAdressTitle h1"><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, PageOrderDetailAF %>" /></div>
                                <div class="zasOrderAdressBox">
                                <strong><%# DataBinder.Eval(Container.DataItem, "af_nazev")%></strong><br />
                                <%# DataBinder.Eval(Container.DataItem, "af_ulice")%><br />
                                <%# DataBinder.Eval(Container.DataItem, "af_mesto")%>, <%# DataBinder.Eval(Container.DataItem, "af_psc")%><br />
                                <%# DataBinder.Eval(Container.DataItem, "af_stat")%><br /><br />
                                <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "ico").ToString()) ? Resources.Resource.IC.ToString() + ": " + DataBinder.Eval(Container.DataItem, "ico") : "" %>
                                <%# !String.IsNullOrEmpty(DataBinder.Eval(Container.DataItem, "dic").ToString()) ? "<br />" + Resources.Resource.DIC.ToString() + ": " + DataBinder.Eval(Container.DataItem, "dic") : "" %>
                                </div>
                            </div>
                            <!-- /zasOrderAddress -->
                        </div>

                        <div class="col-md-6">
                            <!-- zasOrderSummary -->
                            <div class="zasOrderSummary">
                                <div class="zasOrderSummaryTitle h1"><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources: Resource, PageOrderDetailSummary %>" /></div>
                                <table class="table table-condensed table-bordered">
                                    <tr>
                                        <th><asp:Literal ID="Literal9" runat="server" Text="<%$ Resources: Resource, OrdersDatPrij %>" /></th>
                                        <td><%# DataBinder.Eval(Container.DataItem, "dat_pri_txt")%></td>
                                    </tr>
                                    <tr>
                                        <th><asp:Literal ID="Literal11" runat="server" Text="<%$ Resources: Resource, OrdersDatExp %>" /></th>
                                        <td><%# DataBinder.Eval(Container.DataItem, "dat_expedice_txt")%></td>
                                    </tr>
                                    <tr>
                                        <th><asp:Literal ID="Literal4" runat="server" Text="<%$ Resources: Resource, PageOrderDetailSummaryCC_BDPH %>" /></th>
                                        <td><%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_bez_dph")))%>  <%# GetFormatCurrency(DataBinder.Eval(Container.DataItem, "id_meny").ToString())%></td>
                                    </tr>
                                    <tr>
                                        <th><asp:Literal ID="Literal5" runat="server" Text="<%$ Resources: Resource, PageOrderDetailSummaryCC_DPH %>" /></th>
                                        <td><%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "dph")))%>  <%# GetFormatCurrency(DataBinder.Eval(Container.DataItem, "id_meny").ToString())%></td>
                                    </tr>
                                    <tr>
                                        <th><asp:Literal ID="Literal6" runat="server" Text="<%$ Resources: Resource, PageOrderDetailSummaryCC_SDPH %>" /></th>
                                        <td><strong><%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_celkem")))%>  <%# GetFormatCurrency(DataBinder.Eval(Container.DataItem, "id_meny").ToString())%></strong></td>
                                    </tr>
                                    <tr>
                                        <th><asp:Literal ID="Literal8" runat="server" Text="<%$ Resources: Resource, PageOrderDetailSummaryZO %>" /></th>
                                        <td><%# DataBinder.Eval(Container.DataItem, "zpusob_odberu")%></td>
                                    </tr>
                                    <tr>
                                        <th><asp:Literal ID="Literal7" runat="server" Text="<%$ Resources: Resource, PageOrderDetailSummaryZP %>" /></th>
                                        <td><%# DataBinder.Eval(Container.DataItem, "zpusob_platby")%></td>
                                    </tr>
                                    <asp:PlaceHolder runat="server" ID="phElPayState" Visible='<%#   DataBinder.Eval(Container.DataItem, "zpusob_platby_el_platba").ToString()!="0" %>'>
                                    <tr>
                                        <th><asp:Literal ID="Literal10" runat="server" Text="<%$ Resources: Resource, OrdersPaymentStatusTitle %>" /></th>
                                        <td><%# GetResourceForPayment(ZASutility.MyUtility.SafeEvalString(Container.DataItem, "gopay_status")) %></td>
                                    </tr>
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" ID="phElPayAgain" Visible='<%# DataBinder.Eval(Container.DataItem, "zpusob_platby_el_platba").ToString()=="20" && DataBinder.Eval(Container.DataItem, "gopay_status").ToString()!="10" && !String.IsNullOrEmpty(ZASutility.MyUtilitySpecial.GetCurrencyIsoCode(ZASutility.MyUtility.SafeEvalString(Container.DataItem, "id_meny"))) %>'>
                                    <tr>
                                        <th></th>
                                        <td><asp:LinkButton runat="server" ID="gpPayBtn" OnClick="gpPayBtn_Click" CssClass="" Text="<%$ Resources: Resource, OrdersPaymentPayAgaing %>" /></td>
                                    </tr>
                                    </asp:PlaceHolder>
                                    <asp:PlaceHolder runat="server" Visible='<%# DataBinder.Eval(Container.DataItem, "zpusob_platby_el_platba").ToString()=="30" && DataBinder.Eval(Container.DataItem, "gopay_status").ToString()!="10" && !String.IsNullOrEmpty(ZASutility.MyUtilitySpecial.GetCurrencyIsoCode(ZASutility.MyUtility.SafeEvalString(Container.DataItem, "id_meny"))) %>'>
                                    <tr>
                                        <th></th>
                                        <td><asp:LinkButton runat="server" OnClick="PayPalBtn_Click" CssClass="" Text="<%$ Resources: Resource, OrdersPaymentPayAgaing %>" /></td>
                                    </tr>
                                    </asp:PlaceHolder>
                                </table>
                            </div>
                            <!-- /zasOrderSummary -->
                        </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>

            <div class="zasOrderDetail">
            <!-- zasOrderContent -->
                <div class="zasOrderContent">

                <h2 class="h1"><%= ZASutility.MyUtility.GetLangResource("TopOrdersItemsEmpty") %></h2>
    
                    <div class="table-responsive">
                    <table class="zasOrderTable table table-condensed table-bordered">

                        <thead>
                            <tr>
                                <th><asp:Literal ID="Literal7" runat="server" Text="<%$ Resources: Resource, PageOrderDetailItemsItems %>" /></th>
                                <th class="aRight"><asp:Literal ID="lThBasketQty" runat="server" Text="<%$ Resources: Resource, OrderItemQtyOrdered %>" /></th>
                                <th class="aRight"><asp:Literal ID="Literal12" runat="server" Text="<%$ Resources: Resource, OrderItemQtyExp %>" /></th>

                                <th class="aRight"><asp:Literal ID="lThBasketPriceNoDph" runat="server" Text="<%$ Resources: Resource, BasketPriceNoDph %>" /></th>
                                <th class="aRight"><asp:Literal ID="lThBasketPriceWithDph" runat="server" Text="<%$ Resources: Resource, BasketPriceWithDph %>" /></th>
                            </tr>
                        </thead>

                        <tbody>
                            <asp:Repeater ID="rOrderDetailItemsTable" runat="server" OnItemDataBound="rOrderDetailItemsTable_ItemDataBound" >
                                <ItemTemplate>
                                    <tr>
                                        <td>
                                            <%# DataBinder.Eval(Container.DataItem, "dbs").ToString() == "1" ? DataBinder.Eval(Container.DataItem, "nazev") : "<a href='" + DataBinder.Eval(Container.DataItem, "web_items_url").ToString() + "'>" + DataBinder.Eval(Container.DataItem, "nazev").ToString() + "</a>"%>
                                            <asp:PlaceHolder runat="server" ID="phItemAtr1" Visible='<%# DataBinder.Eval(Container.DataItem, "dbs").ToString()!="1" && DataBinder.Eval(Container.DataItem, "atribut_1_nazev").ToString()!="" %>'>
					    <br /><%# DataBinder.Eval(Container.DataItem, "dbs").ToString()=="1" ? "" : DataBinder.Eval(Container.DataItem, "atribut_1_nazev")%>: <%# DataBinder.Eval(Container.DataItem, "dbs").ToString()=="1" ? "" : DataBinder.Eval(Container.DataItem, "atribut_1")%>
                                            </asp:PlaceHolder>
                                            <asp:PlaceHolder runat="server" ID="phItemAtr2" Visible='<%# DataBinder.Eval(Container.DataItem, "dbs").ToString()!="1" && DataBinder.Eval(Container.DataItem, "atribut_2_nazev").ToString()!="" %>'>
					    <br /><%# DataBinder.Eval(Container.DataItem, "dbs").ToString()=="1" ? "" : DataBinder.Eval(Container.DataItem, "atribut_2_nazev")%>: <%# DataBinder.Eval(Container.DataItem, "dbs").ToString()=="1" ? "" : DataBinder.Eval(Container.DataItem, "atribut_2")%>
                                            </asp:PlaceHolder>
                                            <asp:PlaceHolder runat="server" ID="phItemAtr3" Visible='<%# DataBinder.Eval(Container.DataItem, "dbs").ToString()!="1" && DataBinder.Eval(Container.DataItem, "atribut_3_nazev").ToString()!="" %>'>
                                            <br /><%# DataBinder.Eval(Container.DataItem, "dbs").ToString()=="1" ? "" : DataBinder.Eval(Container.DataItem, "atribut_3_nazev")%>: <%# DataBinder.Eval(Container.DataItem, "dbs").ToString()=="1" ? "" : DataBinder.Eval(Container.DataItem, "atribut_3")%>
                                            </asp:PlaceHolder>
                                        </td>
                                        <td class="aRight"><%# DataBinder.Eval(Container.DataItem, "dbs").ToString()=="1" ? "0.00" : ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "mnozstvi_obj")).ToString("0") %> <span class="text-lowercase"><%# DataBinder.Eval(Container.DataItem, "dbs").ToString()=="1" ? "" : DataBinder.Eval(Container.DataItem, "mj")%></span> </td>
                                        <td class="aRight"><%# DataBinder.Eval(Container.DataItem, "dbs").ToString()=="1" ? "0.00" : ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "mnozstvi_vyd")).ToString("0") %> <span class="text-lowercase"><%# DataBinder.Eval(Container.DataItem, "dbs").ToString()=="1" ? "" : DataBinder.Eval(Container.DataItem, "mj")%></span> </td>


                                        <td class="aRight"><%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "web_items_cena_bez_dph")))%>  <%# GetFormatCurrency(DataBinder.Eval(Container.DataItem, "id_meny").ToString())%></td>
                                        <td class="aRight"><%# GetFormatPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "web_items_cena_s_dph")))%>  <%# GetFormatCurrency(DataBinder.Eval(Container.DataItem, "id_meny").ToString())%></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                        
                    </table>
                    </div>
    
                </div>
                <!-- /zasOrderContent -->
  
                <zas:ZasAttachments id="dlFiles" runat="server" RepeatDirection="Vertical"
                    RepeatColumns="15"
                    GridLines="None" ItemStyle-HorizontalAlign="Left" CellPadding="5" 
                    ItemStyle-VerticalAlign="Top"
                    XPathRoot="detail" XPath="detail/file_items/file_item" OnItemDataBound="dlFiles_ItemDataBound" OnItemCommand="dlFiles_ItemCommand" >
                    <ItemTemplate>
                        <div style="text-align: center;">
                            <asp:LinkButton ID="btDownload" Runat="server" CssClass="zasOrderBottomLink"
                                CommandName="Download" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "full_path")+"|"+DataBinder.Eval(Container.DataItem, "file_name_old")%>'>
                                <%# GetAttachmentsLabel(DataBinder.Eval(Container.DataItem, "tabulka").ToString().Trim()) %>
                            </asp:LinkButton>&nbsp;&nbsp;&nbsp;
                        </div>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </zas:ZasAttachments>

                <div class="order-buttons">
                    <asp:LinkButton ID="btOrderToBasket" Runat="server" CssClass="zasOrderBottomLink btn btn-basic" OnClick="btOrderToBasket_Click" Text="<%$ Resources: Resource, OrderDetailItemsToBasket %>" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
