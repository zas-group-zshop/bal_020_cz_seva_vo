<%@ Page Language="C#" MasterPageFile="~/ZASshop.Master" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="ZASshop.NET.ProductList" %>

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
            <div class="pageDesc page-description main-page-description hidden-xs">
                <h1><asp:Literal ID="lh1" runat="server"></asp:Literal></h1>
                <div class="page-description-text">
                    <asp:Panel ID="pDescription" runat="server" />
                </div>
            </div>
            <div class="p-compare">
                <asp:LinkButton ID="hpCompareLink" runat="server" Visible="false" Text="<%$ Resources: Resource, CompareShow %>" />
                <asp:PlaceHolder ID="phCompareLinkDelete" runat="server" Visible="false">
                    &nbsp;(<asp:LinkButton ID="hpCompareLinkDelete" runat="server" Visible="false" Text="<%$ Resources: Resource, CompareLinkDeleteText %>" onclick="hpCompareLinkDelete_Click" />)
                </asp:PlaceHolder>
            </div>

            <!-- /pageDesc -->

            <div class="product-list-signpost">
                <asp:Panel ID="ProductListSignpost" runat="server" CssClass="ProductListSignpost">

                    <asp:Panel ID="pSignpost" runat="server" CssClass="pSignpost category-box hidden-xs">
                        <h2><span><asp:Literal ID="lRozcestnik" runat="server" Text="<%$ Resources: Resource, Directory %>" /></span></h2>
                        <zas:ZASmenu ID="pSignpostUl" runat="server"
                            MenuResultHtml="ul" CssClass="group signpost-row"
                            MenuDepthMax="1" />
                    </asp:Panel>
            
                    <asp:Panel ID="pAction" runat="server" Visible="false" CssClass="category-box">
                        <h2><span><asp:Literal ID="lAkce" runat="server" Text="<%$ Resources: Resource, Action %>" /></span></h2>
                        <div class="ProductListCatalog" style="clear:both;">
                            <asp:PlaceHolder ID="phAkce" runat="server" />
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="pSelected" runat="server" CssClass="category-box">
                        <h2><span><asp:Literal ID="lVybranePolozky" runat="server" Text="<%$ Resources: Resource, SelectedItems %>" /></span></h2>
                        <div class="ProductListCatalog" style="clear:both;">
                            <asp:PlaceHolder ID="phSelected" runat="server" />
                        </div>
                    </asp:Panel>
            
                    <asp:Panel ID="pSearchResult" runat="server" CssClass="category-box hidden-xs">
                        <h2><span><asp:Literal ID="lNejhledanejsi" runat="server" Text="<%$ Resources: Resource, MostWanted %>" /></span></h2>
                        <asp:Repeater ID="SearchResultRepeater" runat="server">
                            <HeaderTemplate><ul class="SearchResultUl"></HeaderTemplate>
                            <ItemTemplate><li><%# ((System.Data.DataRowView)Container.DataItem)["txt"] %></li></ItemTemplate>
                            <FooterTemplate></ul></FooterTemplate>
                        </asp:Repeater>
                    </asp:Panel>
                </asp:Panel>
            </div>

            <asp:Panel ID="ProductListList" runat="server">
                <asp:Panel ID="pSearch" runat="server" Visible='<%# (ZASutility.MyUtility.GetSession("vyhl_param")=="0" || ZASutility.MyUtility.GetConfigValue("ProductListControlsSettings/CustomFilters", "enabled").ToLower()=="true") %>'>
                    <h2><asp:Literal ID="lFiltry" runat="server" Text="<%$ Resources: Resource, Filters %>" /></h2>
                    
                    <!-- filterBox -->
                    <div class="filterBox">
                        <div class="filterBox-man">
                            <asp:Label ID="lFilterMan" runat="server" CssClass="filterBox-man-label" />
                            <asp:CheckBoxList ID="chBoxListManufacturer" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="BoxListManufacturer_OnSelectedIndexChanged" AutoPostBack="True" />
                            <asp:DropDownList ID="dbBoxListManufacturer" runat="server" OnSelectedIndexChanged="BoxListManufacturer_OnSelectedIndexChanged" AutoPostBack="true" />
                        </div>
                        <zas:ZasPlaceHolder ID="phFiltersByProperties" runat="server" CssClassForInnerPanels="filterStockAndPicture" />
                        <asp:PlaceHolder ID="phCustomFilters" runat="server" />
                        
                         <asp:LinkButton ID="lbCustomSearch" runat="server" cssClass="customSearchLink" Text="<%$ Resources: Resource, FiltersCustomSearchBtnTitle %>" />
                        
                    </div>
                    <!-- /filterBox -->
                    
                </asp:Panel>

                <asp:Panel ID="pSortPaging" runat="server" CssClass="category-paging order-box form-inline">
                    <asp:Panel ID="pSort" runat="server" CssClass="pSort">
                        <label><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources: Resource, SortBy %>"></asp:Literal>:</label>
                        <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSort_OnSelectedIndexChanged" CssClass="form-control input-sm" />

                        <label><asp:Literal ID="Literal2" runat="server" Text="<%$ Resources: Resource, ProductsCountOnPage %>"></asp:Literal>:</label>
                        <asp:DropDownList ID="ddlResultCount" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlResultCount_OnSelectedIndexChanged" CssClass="form-control input-sm" />

                        <script type="text/javascript">
                            function pageLoad() {
                                if($(".ajax__tab_active").find("#__tab_ctl00_ZasShopBodyPlaceHolder_tabProductList_TabProductListCatalog").length > 0){
                                  $("#changeView option[value='cat']").attr('selected', true);
                                }

                                if($(".ajax__tab_active").find("#__tab_ctl00_ZasShopBodyPlaceHolder_tabProductList_TabProductListList").length > 0){
                                    $("#changeView option[value='tab']").attr('selected', true);
                                 }
                                }

                                function getView() {
                                   var x = $("#changeView").val();
                                   if(x == "cat") {
                                     document.getElementById("__tab_ctl00_ZasShopBodyPlaceHolder_tabProductList_TabProductListCatalog").click();
                                   } else {
                                     document.getElementById("__tab_ctl00_ZasShopBodyPlaceHolder_tabProductList_TabProductListList").click();
                                   }
                                }

                                $(document).ready( function() {
                                  pageLoad();
                                });
                        </script>

                        <label>Zobrazení</label>
                        <select id="changeView" onchange="getView()" class="form-control input-sm">
                            <option value="cat">Katalogové</option>
                            <option value="tab">Tabulkové</option>
                        </select>
                    </asp:Panel>

                    <asp:Panel ID="pPagingTop" runat="server" CssClass="pPagingTop paging" />

                    <asp:Panel ID="pResultCount" runat="server">
                    </asp:Panel>
                </asp:Panel>
                
                
                <asp:Panel ID="pProductList" runat="server">
                    <asp:TabContainer ID="tabProductList" runat="server" ActiveTabIndex="0" OnActiveTabChanged="tabProductList_ActiveTabChanged" AutoPostBack="true">
                        <asp:TabPanel ID="TabProductListCatalog" CssClass="catalogView" runat="server" HeaderText="<%$ Resources: Resource, TabProductListCatalog %>">
                        </asp:TabPanel>
                        <asp:TabPanel ID="TabProductListPicture" runat="server" HeaderText="<%$ Resources: Resource, TabProductListPicture %>">
                        </asp:TabPanel>
                        <asp:TabPanel ID="TabProductListList" CssClass="tableView" runat="server" HeaderText="<%$ Resources: Resource, TabProductListList %>">
                        </asp:TabPanel>
                    </asp:TabContainer>
                </asp:Panel>

                <asp:Panel ID="pPagingBottom" runat="server" CssClass="pPagingTop paging" />
            </asp:Panel>

            <asp:Panel ID="CustomSearchAction_Panel" runat="server">
                <asp:ModalPopupExtender ID="CustomSearchAction_mpe" runat="server"
                    TargetControlID="lbCustomSearch" PopupControlID="CustomSearchAction"
                    DropShadow="true" BackgroundCssClass="modal"/>
                <asp:Panel ID="CustomSearchAction" runat="server" CssClass="modal-popup">
                    <asp:PlaceHolder ID="phCustomSearch" runat="server"></asp:PlaceHolder>
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="CompareAction_Panel" runat="server">
                <asp:ModalPopupExtender ID="CompareAction_mpe" runat="server"
                    TargetControlID="hpCompareLink" PopupControlID="CompareAction"
                    DropShadow="true" BackgroundCssClass="modal"/>
                <asp:Panel ID="CompareAction" runat="server" CssClass="modal-popup">
                    <asp:PlaceHolder ID="phCompareAction" runat="server"></asp:PlaceHolder>
                </asp:Panel>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
