page 33000918 "Equipment Breakdown B2B"
{

    Caption = 'Equipment Breakdown';
    CardPageID = "View Job Cards B2B";
    Editable = false;
    PageType = ListPart;
    SourceTable = "PM Job Header B2B";
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
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the No.';
                }
                field("Machine ID"; Rec."Machine ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Machine ID.';
                }
                field("Machine Name"; Rec."Machine Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Machine Name.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the type.';
                }
                field("Expected Resource Cost"; Rec."Expected Resource Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Expected resource cost.';
                }
                field("Expected Spares Cost"; Rec."Expected Spares Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Expected Spares cost.';
                }
                field("Actual Resource Cost"; Rec."Actual Resource Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Actual Resource cost.';
                }
                field("Actual Spares Cost"; Rec."Actual Spares Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Actual Spares cost.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = all;
                    ToolTip = 'It Specifies the Total cost.';
                }
            }
        }
    }

    actions
    {
    }
}

