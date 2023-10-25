using System;
using UnityEngine;

// Token: 0x02000028 RID: 40
public class PickUpController : MonoBehaviour
{
	// Token: 0x060000A0 RID: 160 RVA: 0x00003C70 File Offset: 0x00001E70
	private void Start()
	{
		if (!this.equipped)
		{
			this.rb.isKinematic = false;
			this.coll.isTrigger = false;
		}
		if (this.equipped)
		{
			this.rb.isKinematic = true;
			this.coll.isTrigger = true;
			PickUpController.slotFull = true;
		}
	}

	// Token: 0x060000A1 RID: 161 RVA: 0x00003CC4 File Offset: 0x00001EC4
	private void SaveScale()
	{
		PlayerPrefs.SetFloat("scaleX", base.transform.localScale.x);
		PlayerPrefs.SetFloat("scaleY", base.transform.localScale.y);
		PlayerPrefs.SetFloat("scaleZ", base.transform.localScale.z);
	}

	// Token: 0x060000A2 RID: 162 RVA: 0x00003D1F File Offset: 0x00001F1F
	private void Awake()
	{
		this.SaveScale();
	}

	// Token: 0x060000A3 RID: 163 RVA: 0x00003D28 File Offset: 0x00001F28
	private void Update()
	{
		Vector3 vector = this.player.position - base.transform.position;
		if (!this.equipped && vector.magnitude <= this.pickUpRange && Input.GetKeyDown(KeyCode.E) && !PickUpController.slotFull)
		{
			this.PickUp();
		}
		if (this.equipped && Input.GetKeyDown(KeyCode.Q))
		{
			this.Drop();
		}
	}

	// Token: 0x060000A4 RID: 164 RVA: 0x00003D98 File Offset: 0x00001F98
	private void PickUp()
	{
		this.equipped = true;
		PickUpController.slotFull = true;
		base.transform.SetParent(this.gunContainer);
		base.transform.localPosition = Vector3.zero;
		base.transform.localRotation = Quaternion.Euler(Vector3.zero);
		base.transform.localScale = Vector3.one;
		this.rb.isKinematic = true;
		this.coll.isTrigger = true;
	}

	// Token: 0x060000A5 RID: 165 RVA: 0x00003E10 File Offset: 0x00002010
	private void Drop()
	{
		this.equipped = false;
		PickUpController.slotFull = false;
		base.transform.SetParent(null);
		this.rb.isKinematic = false;
		this.coll.isTrigger = false;
		this.rb.AddForce(this.fpsCam.forward * this.dropForwardForce, ForceMode.Impulse);
		this.rb.AddForce(this.fpsCam.up * this.dropUpwardForce, ForceMode.Impulse);
		float num = UnityEngine.Random.Range(-1f, 1f);
		this.rb.AddTorque(new Vector3(num, num, num) * 10f);
		base.transform.localScale = new Vector3(PlayerPrefs.GetFloat("scaleX"), PlayerPrefs.GetFloat("scaleY"), PlayerPrefs.GetFloat("scaleZ"));
	}

	// Token: 0x060000A6 RID: 166 RVA: 0x00003EF0 File Offset: 0x000020F0
	private void OnTriggerEnter(Collider other)
	{
		if (other.CompareTag("Death Zone"))
		{
			this.equipped = false;
			PickUpController.slotFull = false;
			base.transform.SetParent(null);
			this.rb.isKinematic = false;
			this.coll.isTrigger = false;
			float num = UnityEngine.Random.Range(-1f, 1f);
			this.rb.AddTorque(new Vector3(num, num, num) * 10f);
			base.transform.localScale = new Vector3(PlayerPrefs.GetFloat("scaleX"), PlayerPrefs.GetFloat("scaleY"), PlayerPrefs.GetFloat("scaleZ"));
			Debug.Log("Player Death Dropping");
		}
	}

	// Token: 0x0400008B RID: 139
	public Rigidbody rb;

	// Token: 0x0400008C RID: 140
	public BoxCollider coll;

	// Token: 0x0400008D RID: 141
	public Transform player;

	// Token: 0x0400008E RID: 142
	public Transform gunContainer;

	// Token: 0x0400008F RID: 143
	public Transform fpsCam;

	// Token: 0x04000090 RID: 144
	public float pickUpRange;

	// Token: 0x04000091 RID: 145
	public float dropForwardForce;

	// Token: 0x04000092 RID: 146
	public float dropUpwardForce;

	// Token: 0x04000093 RID: 147
	public bool equipped;

	// Token: 0x04000094 RID: 148
	public static bool slotFull;

	// Token: 0x04000095 RID: 149
	private Vector3 baseScale;
}
