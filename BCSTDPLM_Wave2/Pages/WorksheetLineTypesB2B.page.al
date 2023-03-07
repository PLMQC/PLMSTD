page 33000944 "Worksheet Line Types B2B"
{

    Caption = 'Worksheet Line Types';
    PageType = List;
    SourceTable = "Line Type B2B";
    UsageCategory = Administration;
    ApplicationArea = all;

    layout
    {
        area(content)
        {
            repeater(Control1102154000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Description.';
                }
                field(Service; Rec.Service)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Service type.';
                }
                field("Resource Equipment"; Rec."Resource Equipment")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Resource equipment.';
                }
                field("Spares & Consumables"; Rec."Spares & Consumables")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Spares & Consumables.';
                }
                field("Resource Person"; Rec."Resource Person")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Resource Person.';
                }
            }
        }
    }

    actions
    {
    }
}

