<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductListPicture.ascx.cs" Inherits="ZASshop.NET.ProductListPicture" %>

<%@ Register Assembly="ZAScontrols"        Namespace="ZAScontrols"        TagPrefix="zas" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Panel runat="server">
<div class="product-list-picture">
    <asp:Repeater ID="rProductListPicture" runat="server" 
        OnItemCommand="rProductList_ItemCommand" 
        onitemdatabound="rProductList_ItemDataBound" >
        <ItemTemplate>

            <asp:Panel ID="pProduktPanel" runat="server" CssClass='<%# "product" + (((Container.ItemIndex + 1) % 3 == 0) ? " mod-3" : "") + (((Container.ItemIndex + 1) % 4 == 0) ? " mod-4" : "") + (((Container.ItemIndex + 1) % 6 == 0) ? " mod-6" : "") + (((Container.ItemIndex + 1) % 2 == 0) ? " mod-2" : "") %>'>

                <div class="inside">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="product-list-image">
                                <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>" title="<%# DataBinder.Eval(Container.DataItem, "nazev") %>">
                                    <img src="<%# DataBinder.Eval(Container.DataItem, "web_items_preview_file") %>" alt="<%# DataBinder.Eval(Container.DataItem, "nazev") %>" />
                                    <span class="new-badge">
                                      <%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "odznaky_html") %>
                                    </span>
                                    <asp:PlaceHolder runat="server" visible="false">
                                    <span class="<%# DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "10" ? "badge mod-news" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "12" ? "badge mod-action" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "20" ? "badge mod-sellout" : "badge mod-none")) %>">
                                        <%# DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "10" ? ZASutility.MyUtility.GetLangResource("ActionTypeNewsName") : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "12" ? ZASutility.MyUtility.GetLangResource("ActionTypeActionName") : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "20" ? ZASutility.MyUtility.GetLangResource("ActionTypeSellOutName") : "")) %>
                                    </span>
                                    </asp:PlaceHolder>
                                </a>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <h2 class="product-list-title">
                            <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>"><%# DataBinder.Eval(Container.DataItem, "nazev") %></a>
                            </h2>
                        </div>
                        <div class="col-sm-12 text-container">
                                                                                        <p class="desc"><%# DataBinder.Eval(Container.DataItem, "zkraceny_popis") %></p>
                                                                                    </div>
                        <div class="col-md-6">
                        <div class="priceInfo">
                            <span class="price"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.PriceOnly, DataBinder.Eval(Container.DataItem, "cena").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></span>
                            <span class="dph"> <%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.CurrencyOnly, DataBinder.Eval(Container.DataItem, "cena").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %> <%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.DescriptionOnly, DataBinder.Eval(Container.DataItem, "cena").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></span>
                        </div>
                        </div>
                        <div class="col-md-6">
                            <asp:Panel ID="pAddToBasket" runat="server" CssClass="tools">
                            <br><br>
                            <fieldset>
                                <zas:IntoBasketButton ID="btIntoBasket" runat="server" style="margin: 0px -30px;padding:4px 10px 1px;" CssClass="button btn btn-basic btn-xs" CommandName="IntoBasket" ToolTip="<%$ Resources: Resource, BasketAfterInsertTitle %>" Text="<%$ Resources: Resource, BasketInsertItem %>"
                                    TbQuantityId="tbQuantity"
                                    Atribut1Id="ddlAtribut1" Atribut2Id="ddlAtribut2" Atribut3Id="ddlAtribut3"
                                    Atribut1IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_1_nazev") %>' Atribut2IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_2_nazev") %>' Atribut3IdName='<%# DataBinder.Eval(Container.DataItem, "atribut_3_nazev") %>'
                                    IdNomen='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>'
                                    CisloNomen='<%# DataBinder.Eval(Container.DataItem, "cislo_nomenklatury") %>'
                                    TypAtributu='<%# DataBinder.Eval(Container.DataItem, "typ_atributu") %>'
                                    Nazev='<%# DataBinder.Eval(Container.DataItem, "nazev") %>'
                                    IdMj='<%# DataBinder.Eval(Container.DataItem, "id_mj") %>'
                                    Mj='<%# DataBinder.Eval(Container.DataItem, "mj") %>'
                                    Cena='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena")) %>'
                                    Dph='<%# DataBinder.Eval(Container.DataItem, "dph_anone").ToString()=="1" ? true : false %>'
                                    CenaMistni='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_mistni")) %>'
                                    IdMeny='<%# DataBinder.Eval(Container.DataItem, "id_meny") %>'
                                    SazbaDph='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "sazba_dph")) %>'
                                    KoeficientDph='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "koeficient")) %>'
                                    ZasobaCelkem='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "zasoba_celkem")) %>' />
                            </fieldset>
                        </asp:Panel>
                        </div>
                    </div>
                </div>

            </asp:Panel><!-- .product -->

            <!-- clearovaci div pro resp. design -->
            <asp:Panel runat="server" ID="clearDiv_2" CssClass="border-div clearfix visible-xs-block hidden-sm hidden-md hidden-lg" Visible='<%# ((Container.ItemIndex + 1) % 2 == 0) %>' />
            <asp:Panel runat="server" ID="clearDiv_3" CssClass="border-div clearfix hidden-xs visible-sm-block hidden-md hidden-lg" Visible='<%# ((Container.ItemIndex + 1) % 3 == 0) %>' />
            <asp:Panel runat="server" ID="clearDiv_4" CssClass="border-div clearfix hidden-xs hidden-sm visible-md-block hidden-lg" Visible='<%# ((Container.ItemIndex + 1) % 4 == 0) %>' />
            <asp:Panel runat="server" ID="clearDiv_6" CssClass="border-div clearfix hidden-xs hidden-sm hidden-md visible-lg-block" Visible='<%# ((Container.ItemIndex + 1) % 6 == 0) %>' />
            <!-- clearovaci div pro resp. design -->

        </ItemTemplate>        
    </asp:Repeater>
</div>
</asp:Panel>