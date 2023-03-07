report 33000893 "Equipment Master 1 B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Equipment Master 1.rdl';

    Caption = 'Equipment master 1';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Spare; "Spare B2B")
        {
            DataItemTableView = SORTING(ID, "Machine ID", "Line No.");
            RequestFilterFields = ID;
            column(companyinf_Name; companyinf.Name)
            {
            }
            column(Spare_Spare_MachineName; Spare."Machine Name")
            {
            }
            column(Spare_Spare__Part_No_; Spare."Part No.")
            {
            }
            column(Sl_No_; "Sl.No")
            {
            }
            column(Spare_ItemID; "Item ID")
            {
            }
            column(Spare_Description; Description)
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
            column(Spare__Availablity_Lead_time_; "Availablity Lead Time")
            {
            }
            column(Spare_Address; Address)
            {
            }
            column(DEPARTMENT___MAINTENANCECaption; DEPARTMENT___MAINTENANCECaptionLbl)
            {
            }
            column(SPARE_PARTS_LISTCaption; SPARE_PARTS_LISTCaptionLbl)
            {
            }
            column(REF_NO__Caption; REF_NO__CaptionLbl)
            {
            }
            column(Name_of_the_M_C___No__Caption; Name_of_the_M_C___No__CaptionLbl)
            {
            }
            column(Sl_No_Caption; Sl_No_CaptionLbl)
            {
            }
            column(Item_IDCaption; Item_IDCaptionLbl)
            {
            }
            column(Availability_lead_timeCaption; Availability_lead_timeCaptionLbl)
            {
            }
            column(AddressCaption; AddressCaptionLbl)
            {
            }
            column(DescriptionCaption; DescriptionCaptionLbl)
            {
            }
            column(Part_No_Caption; Part_No_CaptionLbl)
            {
            }
            column(SpecificationsCaption; SpecificationsCaptionLbl)
            {
            }
            column(Qty__Req_Caption; Qty__Req_CaptionLbl)
            {
            }
            column(InventoryCaption; InventoryCaptionLbl)
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

            trigger OnAfterGetRecord();
            begin
                "Sl.No" := "Sl.No" + 1;

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
                    MODIFY();
                end
            end;

            trigger OnPreDataItem();
            begin
                companyinf.GET();
            end;
        }
    }

    requestpage
    {
        Caption = 'Equipment master 1';

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
        VendorItemNo: Text[50];
        "Sl.No": Integer;
        DEPARTMENT___MAINTENANCECaptionLbl: Label 'DEPARTMENT : MAINTENANCE';
        SPARE_PARTS_LISTCaptionLbl: Label 'SPARE PARTS LIST';
        REF_NO__CaptionLbl: Label 'REF.NO.:';
        Name_of_the_M_C___No__CaptionLbl: Label 'Name of the M/C & No.:';
        Sl_No_CaptionLbl: Label 'Sl.No.';
        Item_IDCaptionLbl: Label 'Item ID';
        Availability_lead_timeCaptionLbl: Label 'Availability lead time';
        AddressCaptionLbl: Label 'Address';
        DescriptionCaptionLbl: Label 'Description';
        Part_No_CaptionLbl: Label 'Part No.';
        SpecificationsCaptionLbl: Label 'Specifications';
        Qty__Req_CaptionLbl: Label 'Qty. Req.';
        InventoryCaptionLbl: Label 'Inventory';
}

