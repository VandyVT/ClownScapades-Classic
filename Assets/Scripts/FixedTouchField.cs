using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class FixedTouchField : MonoBehaviour, IPointerDownHandler, IPointerUpHandler
{
    public Vector2 TouchDist;
    protected int PointerId;
    public Vector2 PointerOld;
    public bool Pressed;

    void Update()
    {
        if (Pressed)
        {
            if (Input.touchCount <= 0) return;

            // Checking whether we touched joystick first or not, if yes then we will assign some other finger to the panel
            int index = -1;
            for (int i = 0; i < Input.touchCount; i++)
            {
                if (Input.GetTouch(i).position.x > Screen.width / 3)
                {
                    index = i;
                    break;
                }
            }
            // Checking whether there was any valid finger on the panel
            if (index < 0) return;

            if (Input.GetTouch(index).phase == TouchPhase.Began)
            {
                PointerOld = Input.touches[index].position;
            }
            else if (Input.GetTouch(index).phase == TouchPhase.Moved)
            {
                TouchDist = Input.touches[index].position - PointerOld;
                PointerOld = Input.touches[index].position;
            }
            else if (Input.GetTouch(index).phase == TouchPhase.Stationary)
            {
                TouchDist = Vector2.zero;
            }
        }


        else
        {
            TouchDist = new Vector2();
        }
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        if (Pressed) return;
        Pressed = true;
    }


    public void OnPointerUp(PointerEventData eventData)
    {
        Pressed = false;
    }
}