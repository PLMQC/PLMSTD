report 33000894 "Equipment - Spares List B2B"
{

    DefaultLayout = RDLC;

    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Equipment - Spares List.rdl';
    Caption = 'Equipment - Spares List';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Equipment; "Equipment B2B")
        {
            DataItemTableView = SORTING("No.") ORDER(Ascending);
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(companyinf_Name; companyinf.Name)
            {
            }
            column(Machine_No; "No.")
            {
            }
            column(Machine_Name; Name)
            {
            }
            column(SPARE_PARTS_LISTCaption; SPARE_PARTS_LISTCaptionLbl)
            {
            }
            column(Machine_IDCaption; Machine_IDCaptionLbl)
            {
            }
            column(Machine_NameCaption; Machine_NameCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154041; EmptyStringCaption_Control1102154041Lbl)
            {
            }
            dataitem(Spare; "Spare B2B")
            {
                DataItemLink = "Machine ID" = FIELD("No.");
                DataItemTableView = SORTING("Sl. No.") WHERE("Item ID" = FILTER(<> ''));
                column(ItemRec__Vendor_No__; ItemRec."Vendor No.")
                {
                }
                column(Spare_Spare__Availablity_Lead_time_; Spare."Availablity Lead Time")
                {
                }
                column(Spare_ItemID; "Item ID")
                {
                }
                column(VendorItemNo; VendorItemNo)
                {
                }
                column(Spare_Specifications; Specifications)
                {
                }
                column(Spare_NOS; "Nos.")
                {
                }
                column(Inventory; Inventory)
                {
                }
                column(Spare_Description; Description)
                {
                }
                column(Spare_SlNo; "Sl. No.")
                {
                }
                column(ID_Spare; Spare.ID)
                {
                }
                column(Spare_Spare__Phone_No_; Spare."Phone No.")
                {
                }
                column(Item_IDCaption; Item_IDCaptionLbl)
                {
                }
                column(Part_NoCaption; Part_NoCaptionLbl)
                {
                }
                column(SpecificationCaption; SpecificationCaptionLbl)
                {
                }
                column(Qty_ReqCaption; Qty_ReqCaptionLbl)
                {
                }
                column(InventoryCaption; InventoryCaptionLbl)
                {
                }
                column(VendorCaption; VendorCaptionLbl)
                {
                }
                column(Availability_lead_timeCaption; Availability_lead_timeCaptionLbl)
                {
                }
                column(Sl__No_Caption; Sl__No_CaptionLbl)
                {
                }
                column(Spare_DescriptionCaption; FIELDCAPTION(Description))
                {
                }
                column(Machine_IdCaption_Control1102154042; Machine_IdCaption_Control1102154042Lbl)
                {
                }
                column(Spare_ID; ID)
                {
                }
                column(Spare_Machine_ID; "Machine ID")
                {
                }
                column(Spare_Line_No_; "Line No.")
                {
                }
                column(SlNo; SlNo)
                {
                }

                trigger OnAfterGetRecord();
                begin
                    SlNo := SlNo + 1;

                    CLEAR(Description);
                    CLEAR(VendorItemNo);
                    CLEAR(Inventory);

                    if ItemRec.GET(Spare."Item ID") then begin
                        Description := ItemRec.Description;
                        VendorItemNo := ItemRec."Vendor Item No.";
                        ItemRec.CALCFIELDS(ItemRec.Inventory);
                        Inventory := ItemRec.Inventory;


                        Spare.Description := ItemRec.Description;
                        Spare."Part No." := ItemRec."Vendor Item No.";
                        ItemRec.CALCFIELDS(ItemRec.Inventory);
                        Spare."Availablity Lead Time" := ItemRec."Lead Time Calculation";
                        MODIFY();
                    end;
                end;

                trigger OnPreDataItem();
                begin
                    SlNo := 0;
                end;
            }

            trigger OnPreDataItem();
            begin
                companyinf.GET();
            end;
        }
    }

    requestpage
    {
        Caption = 'Equipment - Spares List';

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        ItemRec: Record Item;
        companyinf: Record "Company Information";
        SlNo: Integer;
        VendorItemNo: Text[50];
        SPARE_PARTS_LISTCaptionLbl: Label 'SPARE PARTS LIST';
        Machine_IDCaptionLbl: Label 'Machine ID    :';
        Machine_NameCaptionLbl: Label 'Machine Name    :';
        EmptyStringCaptionLbl: Label ':';
        EmptyStringCaption_Control1102154041Lbl: Label ':';
        Item_IDCaptionLbl: Label 'Item ID';
        Part_NoCaptionLbl: Label 'Part No';
        SpecificationCaptionLbl: Label 'Specification';
        Qty_ReqCaptionLbl: Label 'Qty.Req';
        InventoryCaptionLbl: Label 'Inventory';
        VendorCaptionLbl: Label 'Vendor';
        Availability_lead_timeCaptionLbl: Label 'Availability lead time';
        Sl__No_CaptionLbl: Label 'Sl. No.';
        Machine_IdCaption_Control1102154042Lbl: Label 'Machine Id';
}

