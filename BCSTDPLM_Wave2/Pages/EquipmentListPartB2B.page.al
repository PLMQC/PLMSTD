page 33000908 "Equipment List Part B2B"
{
    Caption = 'Equipment List Part';
    Editable = false;
    PageType = ListPart;
    SourceTable = "Equipment B2B";
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'This Field Shows the No. Of the Equipment.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'This Field Shows the Name of the Equipment.';
                }
                field("Model No."; Rec."Model No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'This Field Shows the Model No of the Equipment.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'This Field Shows the Vendor No.';
                }
                field(Manufacturer; Rec.Manufacturer)
                {
                    ApplicationArea = All;
                    ToolTip = 'This Field Shows the Manufacturer.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'This Field Shows the Serial Number of the Equipment.';
                }
                field("Machine Location"; Rec."Machine Location")
                {
                    ApplicationArea = All;
                    ToolTip = 'This Field Shows the Equipment Location.';
                }
                field("Maintainanced By"; Rec."Maintainanced By")
                {
                    ApplicationArea = All;
                    ToolTip = 'This Field Shows the Details of maintenance by.';
                }
                field("Service Vendor"; Rec."Service Vendor")
                {
                    ApplicationArea = All;
                    ToolTip = 'This Field Shows the Service Vendor Of the Equipment.';
                }
                field("Equipment Type"; Rec."Equipment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'This Field Shows the Type Of the Equipment.';
                }
            }
        }
    }

    actions
    {
    }
}