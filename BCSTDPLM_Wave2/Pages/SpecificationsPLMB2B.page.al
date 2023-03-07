page 33000939 "Specifications PLM B2B"
{

    Caption = 'Specifications';
    PageType = List;
    SourceTable = "Specifications B2B";
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
                    ToolTip = 'It Defines code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines Description.';
                }
                field("Base Unit Of Messure"; Rec."Base Unit Of Messure")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Defines UOM.';
                }
            }
        }
    }

    actions
    {
    }
}

