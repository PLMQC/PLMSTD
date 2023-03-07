pageextension 33000896 "Resource Card Ext B2B" extends "Resource Card"
{

    layout
    {
        addafter("Resource Group No.")
        {
            field("Global Dimension 1 Code B2B"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'A global dimension is a dimension that you can use as a filter, It needs to be setup in G/L setup';
            }
            field("DesignationB2B"; Rec."Designation B2B")
            {
                ApplicationArea = All;
                ToolTip = 'It Defines the Designation of the Resource. Designation need to be setup Against The Resource.';

            }
            field("Skill TypeB2B"; Rec."Skill Type B2B")
            {
                ApplicationArea = All;
                ToolTip = 'It Defines the Skill Type of the Resource. Skills need to be Setup Against the Resource.';
            }
        }
    }
    actions
    {
        addafter("S&kills")
        {
            action("ResourceskillB2B")
            {
                ApplicationArea = Advanced;
                ToolTip = 'Skills are the Different Working Capabilities of Resource. These need to be Specified in Resource Skills.';
                Caption = 'S&kills';
                Image = Skills;

                trigger OnAction();
                var
                    ResourceSkill: Record "PM Resource Skill B2B";
                begin
                    // Start  B2BPLM1.00.00
                    Rec.CheckTypeSkills();
                    ResourceSkill.SETRANGE(Type, ResourceSkill.Type::Resource);
                    ResourceSkill.SETRANGE("No.", Rec."No.");
                    PAGE.RUN(PAGE::"PM Resource Skills B2B", ResourceSkill);
                    // Stop   B2BPLM1.00.00
                end;
            }
        }
    }

    //Unsupported feature: InsertAfter on "Documentation". Please convert manually.


    //Unsupported feature: PropertyChange. Please convert manually.

}

