page 33000942 "Maintenance Types B2B"
{
    Caption = 'Maintenace Types';
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Maintenance Type B2B";
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
                field(External; Rec.External)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines External.';
                }
            }
        }
    }

    actions
    {
    }
}

