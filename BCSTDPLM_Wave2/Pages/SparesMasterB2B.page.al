page 33000901 "Spares Master B2B"
{

    Caption = 'Spares Master';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = Item;
    UsageCategory = Lists;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'Component ID';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the No for the Spares.';
                }
                field(Description; Rec.Description)
                {
                    Caption = 'Component Name';
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Name for the Spares.';
                }
                field("Shelf No."; Rec."Shelf No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the Shelf No For the Spare.';
                }
                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Base UOM.';
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Item Category code.';
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Shows the Inventory of the Spare.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Unit cost of the Spare.';
                }
                field("Reorder Point"; Rec."Reorder Point")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines the Reorder Point.';
                }

            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage();
    begin
        PMSetup.GET();
        Rec.SETRANGE("Item Category Code", PMSetup."Item Category Code");
    end;

    var
        PMSetup: Record "Plant Maintenance Setup B2B";
}

