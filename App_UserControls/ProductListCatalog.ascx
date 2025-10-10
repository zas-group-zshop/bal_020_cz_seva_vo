<%@ control language="C#" autoeventwireup="true" codebehind="ProductListCatalog.ascx.cs" inherits="ZASshop.NET.ProductListCatalog" %>

<%@ register assembly="ZAScontrols" namespace="ZAScontrols" tagprefix="zas" %>
<%@ register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>


<asp:Panel runat="server" CssClass="productList product-list-catalog">
    <asp:Repeater ID="rProductListCatalog" runat="server"
        OnItemCommand="rProductList_ItemCommand"
        OnItemDataBound="rProductList_ItemDataBound">
        <ItemTemplate>
            <asp:Panel ID="pProduktPanel" runat="server" CssClass='<%# "product" + (((Container.ItemIndex + 1) % 3 == 0) ? " mod-3" : "") + (((Container.ItemIndex + 1) % 4 == 0) ? " mod-4" : "") + (((Container.ItemIndex + 1) % 2 == 0) ? " mod-2" : "") %>'>

                <div class="inside">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="product-list-image">
                                <a href="<%# DataBinder.Eval(Container.DataItem, "web_items_url") %>" title="<%# DataBinder.Eval(Container.DataItem, "nazev") %>">
                                    <img src="<%# DataBinder.Eval(Container.DataItem, "web_items_preview_file") %>" alt="<%# DataBinder.Eval(Container.DataItem, "nazev") %>" />
                                    <span class="new-badge">
                                        <%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "odznaky_html") %>
                                    </span>
                                    <asp:PlaceHolder runat="server" Visible="false">
                                        <span class="<%# DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "10" ? "badge mod-news" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "12" ? "badge mod-action" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "20" ? "badge mod-sellout" : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "30" ? "badge mod-top" : "badge mod-none"))) %>">
                                            <%# DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "10" ? ZASutility.MyUtility.GetLangResource("ActionTypeNewsName") : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "12" ? ZASutility.MyUtility.GetLangResource("ActionTypeActionName") : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "20" ? ZASutility.MyUtility.GetLangResource("ActionTypeSellOutName") : (DataBinder.Eval(Container.DataItem, "akce_typ").ToString() == "30" ? "TOP" : ""))) %>
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
                        
                        <div class="col-sm-12" style="margin-bottom: 30px;">
                            <table class="table-detail-info">
                                <tr>
                                    <td class="left">Nomenklatura</td>
                                    <td class="right"><%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "cislo_nomenklatury")%></td>
                                </tr>
                                <tr>
                                    <td class="left">EAN</td>
                                    <td class="right"><%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "ean1")%></td>
                                </tr>
                                <tr>
                                    <td class="left">Skupinové balení</td>
                                    <td class="right"><%# ZASutility.MyUtility.SafeEvalString(Container.DataItem, "ean2_id_mj")%></td>
                                </tr>
                                <tr>
                                    <td class="right" colspan="2"><div class="product-list-availability avail"><%# DataBinder.Eval(Container.DataItem, "web_items_stav_skladu") %></div></td>
                                </tr>
                            </table>
                        </div>
                        
                        <div class="col-md-12">
                            <!-- productRight -->
                            <div class="productRight product-list-right">
                                <div class="priceInfo product-list-price-info">

                                    <span class="product-list-price price"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.PriceAndCurrency, DataBinder.Eval(Container.DataItem, "web_items_cena_bez_dph").ToString(), DataBinder.Eval(Container.DataItem, "id_meny").ToString()) %></span>
                                    <span class="product-list-vat dph hidden"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.DescriptionOnly, String.Empty, String.Empty) %></span>
                                    <asp:PlaceHolder ID="phDualPrice" runat="server" Visible="false">
                                        <span class="eura">
                                            <%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.PriceAndCurrency, GetDualPrice(ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_mistni").ToString())).ToString(), ZASutility.MyUtility.GetSession("id_dualni_meny")) %>
                                            <span class="dph"><%# ShowPrice(DataBinder.Eval(Container.DataItem, "dph_anone").ToString(), ZASutility.ShowPriceType.DescriptionOnly, String.Empty, String.Empty) %></span>
                                        </span>
                                    </asp:PlaceHolder>
                                </div>
                            </div>
                            <!-- /productRight -->
                        </div>

                        <div class="col-md-12">
                            <div class="xtools">
                                <asp:Button ID="hlCompare" runat="server" CssClass="compare" ToolTip="<%$ Resources: Resource, CompareToolTip %>" Text="<%$ Resources: Resource, Compare %>" CommandName="IntoCompare" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "cislo_nomenklatury") %>' />
                                <asp:Panel ID="pAddToBasket" runat="server" CssClass="addToBasket product-list-basket" style="text-align: right;">
                                    <div class="form-inline">
                                        <asp:TextBox ID="tbQuantity" runat="server" Text="1" MaxLength="5" CssClass="form-control input-sm xhidden" style="height:36px;" />
                                        <zas:intobasketbutton id="btIntoBasket" runat="server" cssclass="button btn btn-basic btn-sm" commandname="IntoBasket" tooltip="<%$ Resources: Resource, BasketAfterInsertTitle %>" text="DO KOŠÍKU"
                                            tbquantityid="tbQuantity"
                                            atribut1id="" atribut2id="" atribut3id=""
                                            atribut1idname='<%# DataBinder.Eval(Container.DataItem, "atribut_1_nazev") %>' atribut2idname='<%# DataBinder.Eval(Container.DataItem, "atribut_2_nazev") %>' atribut3idname='<%# DataBinder.Eval(Container.DataItem, "atribut_3_nazev") %>'
                                            atribut1prac='<%# DataBinder.Eval(Container.DataItem, "atribut_1_pracovat") %>' atribut2prac='<%# DataBinder.Eval(Container.DataItem, "atribut_2_pracovat") %>' atribut3prac='<%# DataBinder.Eval(Container.DataItem, "atribut_3_pracovat") %>'
                                            atribut1cis='<%# DataBinder.Eval(Container.DataItem, "atribut_1_cis") %>' atribut2cis='<%# DataBinder.Eval(Container.DataItem, "atribut_2_cis") %>' atribut3cis='<%# DataBinder.Eval(Container.DataItem, "atribut_3_cis") %>'
                                            atribut1req='<%# DataBinder.Eval(Container.DataItem, "atribut_1_povinnost") %>' atribut2req='<%# DataBinder.Eval(Container.DataItem, "atribut_2_povinnost") %>' atribut3req='<%# DataBinder.Eval(Container.DataItem, "atribut_3_povinnost") %>'
                                            atributrozliseni='<%# DataBinder.Eval(Container.DataItem, "rozliseni") %>'
                                            idnomen='<%# DataBinder.Eval(Container.DataItem, "id_nomen") %>'
                                            cislonomen='<%# DataBinder.Eval(Container.DataItem, "cislo_nomenklatury") %>'
                                            typatributu='<%# DataBinder.Eval(Container.DataItem, "typ_atributu") %>'
                                            nazev='<%# DataBinder.Eval(Container.DataItem, "nazev") %>'
                                            idmj='<%# DataBinder.Eval(Container.DataItem, "id_mj") %>'
                                            mj='<%# DataBinder.Eval(Container.DataItem, "mj") %>'
                                            cena='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena")) %>'
                                            dph='<%# DataBinder.Eval(Container.DataItem, "dph_anone").ToString()=="1" ? true : false %>'
                                            cenamistni='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "cena_mistni")) %>'
                                            idmeny='<%# DataBinder.Eval(Container.DataItem, "id_meny") %>'
                                            sazbadph='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "sazba_dph")) %>'
                                            koeficientdph='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "koeficient")) %>'
                                            zasobacelkem='<%# ZASutility.MyUtility.StringToNumeric(DataBinder.Eval(Container.DataItem, "zasoba_celkem")) %>' />
                                    </div>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <!-- .product -->

            <!-- clearovaci div pro resp. design -->
            <asp:Panel runat="server" ID="clearDiv_3" CssClass="clearfix hr-line hidden-xs hidden-sm visible-md-block visible-lg-block" data-attr='<%# (Container.ItemIndex) %>' Visible='<%# ((Container.ItemIndex + 1) % 3 == 0) %>' />
            <asp:Panel runat="server" ID="clearDiv_4" CssClass="clearfix hr-line hidden-xs visible-sm-block hidden-md hidden-lg" data-attr='<%# (Container.ItemIndex) %>' Visible='<%# ((Container.ItemIndex + 1) % 2 == 0) %>' />
            <asp:Panel runat="server" ID="clearDiv_4Home" CssClass="clearfix hr-line hidden-xs hidden-sm visible-md-block visible-lg-block visible-Homepage item" data-attr='<%# (Container.ItemIndex) %>' Visible='<%# ((Container.ItemIndex + 1) % 4 == 0) %>' />
            <!-- clearovaci div pro resp. design -->
        </ItemTemplate>
    </asp:Repeater>

    <asp:Panel ID="AfterInsertIntoBasketAction_Panel" runat="server" Visible="false">
        <asp:Button ID="FakeBtnAction" runat="server" CssClass="hide-control hidden" />
        <asp:ModalPopupExtender ID="AfterInsertIntoBasketAction_mpe" runat="server"
            TargetControlID="FakeBtnAction" PopupControlID="AfterInsertIntoBasketAction"
            DropShadow="true" BackgroundCssClass="modal" CancelControlID="hlAfterBack" />
        <asp:Panel ID="AfterInsertIntoBasketAction" runat="server" CssClass="modal-popup">
            <!-- pageDesc -->
            <div class="pageDesc modal-desc">
                <div class="modal-title">
                    <asp:Literal ID="lh1" runat="server" Text="<%$ Resources: Resource, BasketAfterInsertTitle %>"></asp:Literal></div>
                <asp:Panel ID="pDescription" runat="server" CssClass="cartPopupDesc">
                    <p>
                        <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, BasketAfterInsertDesc1 %>" /></p>
                    <p><strong>
                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, BasketAfterInsertDesc2 %>" /></strong></p>
                </asp:Panel>
            </div>
            <!-- /pageDesc -->

            <!-- cartButtons -->
            <div class="cartButtons modal-buttons" data-url='<%: Request.RawUrl %>'>
                <a href='<%: Request.RawUrl %>' class="button btn btn-sm btn-default"><%: ZASutility.MyUtility.GetLangResource("BasketAfterActionBack") %></a>
                <asp:HyperLink ID="hlAfterBack" CssClass="button btn btn-sm btn-default hide-control" runat="server" Text="<%$ Resources: Resource, BasketAfterActionBack %>" />
                <asp:HyperLink ID="hlAfterBasket" CssClass="button btn btn-sm btn-default" runat="server" NavigateUrl="~/kosik" Text="<%$ Resources: Resource, BasketAfterActionBasket %>" />
                <asp:HyperLink ID="hlAfterOrder" CssClass="button btn btn-sm btn-basic" runat="server" NavigateUrl="~/objednavka" Text="<%$ Resources: Resource, BasketAfterActionOrder %>" />
            </div>
            <!-- /cartButtons -->
        </asp:Panel>
    </asp:Panel>

    <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Rows="15" Columns="50" Enabled="false" ReadOnly="true" Visible="false"></asp:TextBox>
</asp:Panel>
