using UnityEngine;
using UnityEngine.UI;

public class MobileControls : MonoBehaviour
{
    public static MobileControls instance;

    [Header("Mobile Controls")]
    public FixedJoystick fixedJoystick;

    [Header("Mobile UI")]
    public Image crouchImage;
    public Sprite[] crouchSprites;

    public FixedTouchField touchField;

    private void Awake()
    {
        if (instance == null)
        {
            instance = this;
        }

        else
        {
            Debug.LogWarning("Multiple instances of the Player found. Keeping the first one.");
            Destroy(gameObject);
        }
    }

    private void Start()
    {
        PlayerMove.instance.fixedJoystick = this.fixedJoystick;
    }

    public void CrouchCheck()
    {
        //bool crouchBool = PlayerCharacter.instance.ReturnCrouchValue();

        /*switch (crouchBool)
        {
            case true:
                {
                    crouchImage.sprite = crouchSprites[1];
                    break;
                }

            case false:
                {
                    crouchImage.sprite = crouchSprites[0];
                    break;
                }
        }
       /PlayerCharacter.instance.CrouchingBoolSwitch();*/
    }
}
