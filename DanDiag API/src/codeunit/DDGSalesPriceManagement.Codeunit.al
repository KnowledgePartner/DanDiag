codeunit 50201 "DDG Sales Price Management"
{
    procedure calcSalesPriceItemCategory(CustomerNo: Code[20]; ItemCategoryCode: Code[20]) ResponseJson: JsonObject
    var
        ItemCategory: Record "Item Category";
        TempSalesHeader: Record "Sales Header" temporary;
        TempSalesLine: Record "Sales Line" temporary;
        Customer: Record Customer;
        Item: Record Item;
        JsonArray: JsonArray;
    begin
        Customer.get(CustomerNo);
        ItemCategory.Get(ItemCategoryCode);
        Clear(JsonArray);

        InitSalesHeader(TempSalesHeader, Customer);

        Item.SetRange("Item Category Code", ItemCategory.Code);
        if Item.FindSet() then
            repeat
                AddItemToSalesOrder(Item, TempSalesLine, TempSalesHeader, JsonArray);
            until item.Next() = 0;

        ResponseJson.Add('Items', JsonArray);
    end;

    procedure calcSalesPriceFromItems(CustomerNo: Code[20]; JsonItems: JsonArray) ResponseJson: JsonObject
    var
        TempSalesHeader: Record "Sales Header" temporary;
        TempSalesLine: Record "Sales Line" temporary;
        Customer: Record Customer;
        Item: Record Item;
        JsonArray: JsonArray;
        JToken: JsonToken;
        JValue: JsonValue;
    begin
        Customer.get(CustomerNo);
        Clear(JsonArray);

        InitSalesHeader(TempSalesHeader, Customer);

        foreach Jtoken in JsonItems do begin
            clear(JValue);
            JValue := JToken.AsValue();
            if Item.get(JValue.AsCode()) then
                AddItemToSalesOrder(Item, TempSalesLine, TempSalesHeader, JsonArray);
        end;

        ResponseJson.Add('Items', JsonArray);
    end;

    local procedure AddItemToSalesOrder(Item: Record Item; var TempSalesLine: Record "Sales Line"; TempSalesHeader: Record "Sales Header"; var jsonArray: JsonArray)
    begin
        TempSalesLine."Document Type" := TempSalesLine."Document Type"::Order;
        TempSalesLine."Document No." := TempSalesHeader."No.";
        TempSalesLine.SetSalesHeader(TempSalesHeader);
        TempSalesLine."Line No." := TempSalesLine."Line No." + 10000;
        TempSalesLine.Validate(Type, TempSalesLine.Type::Item);
        TempSalesLine.Validate("No.", Item."No.");
        TempSalesLine.Validate(Quantity, 1);
        AddItemToJsonArray(Item."No.", TempSalesLine."Unit Price", JsonArray);
    end;

    local procedure InitSalesHeader(var TempSalesHeader: Record "Sales Header"; Customer: record Customer)
    begin

        TempSalesHeader."Document Type" := TempSalesHeader."Document Type"::Order;
        TempSalesHeader."No." := 'PRICE0001';
        TempSalesHeader.Validate("Sell-to Customer No.", Customer."No.");
        TempSalesHeader.InitRecord();
        TempSalesHeader.Insert();

    end;

    local procedure AddItemToJsonArray(ItemNo: Text; Price: Decimal; var JsonArray: JsonArray)
    var
        ItemObject: JsonObject;
    begin
        ItemObject.Add('Item', ItemNo);
        ItemObject.Add('Price', Price);
        JsonArray.add(ItemObject);
    end;


}