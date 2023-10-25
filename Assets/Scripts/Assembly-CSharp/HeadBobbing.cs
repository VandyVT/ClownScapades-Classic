using System;
using UnityEngine;

// Token: 0x02000025 RID: 37
public class HeadBobbing : MonoBehaviour
{
	// Token: 0x06000094 RID: 148 RVA: 0x00003B36 File Offset: 0x00001D36
	private void Start()
	{
		this.Anim = base.GetComponent<Animator>();
		this.bobbing = GameObject.FindObjectOfType<PlayerMove>();
	}

	// Token: 0x06000095 RID: 149 RVA: 0x00003B50 File Offset: 0x00001D50
	private void Update()
	{
		float axisRaw = Input.GetAxisRaw("Horizontal");
		float axisRaw2 = Input.GetAxisRaw("Vertical");
		if (axisRaw != 0f || axisRaw2 != 0f)
		{
			this.Anim.SetBool("PMove", true);
			return;
		}
		this.Anim.SetBool("PMove", false);
	}

	// Token: 0x04000087 RID: 135
	public Animator Anim;

	// Token: 0x04000088 RID: 136
	public PlayerMove bobbing;
}
